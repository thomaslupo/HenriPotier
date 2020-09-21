//
//  BooksViewModelTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 25/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import RxBlocking
import Cuckoo

@testable import HenriPotier

class BooksViewModelTests: XCTestCase {

    var scheduler: TestScheduler!

    var booksViewModel: BooksViewModel!

    var mockBooksUseCase: MockBooksUseCase!
    var mockCartUseCase: MockCartUseCase!
    var mockBooksNavigator: MockBooksNavigator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        scheduler = TestScheduler(initialClock: 0)

        mockBooksUseCase = MockBooksUseCase()
        mockCartUseCase = MockCartUseCase()
        mockBooksNavigator = MockBooksNavigator()

        booksViewModel = BooksViewModel(booksUseCase: mockBooksUseCase,
                                        cartUseCase: mockCartUseCase,
                                        booksNavigator: mockBooksNavigator)
    }

    func testDataSource() {
        let books = Fixtures.getBooks()
        stub(mockBooksUseCase) { stub in
            when(stub).getBooks().thenReturn(Single.just([]),
                                             Single.just(books))
        }

        let output = generateOutput(
            viewWillAppearEvents: Recorded.events(.next(300, ())),
            didSwipeToRefreshEvents: Recorded.events(.next(400, ())))

        let result = scheduler.start {
            output.dataSource.asObservable()
        }

        let emptyDataSource = [BooksSection(title: NSLocalizedString("books.title", comment: ""), items: [])]
        let dataSource = [BooksSection(title: NSLocalizedString("books.title", comment: ""), items: books.map { BookUI(book: $0) })]

        let expectedEvents = [Recorded.next(300, emptyDataSource), Recorded.next(400, dataSource)]

        XCTAssertEqual(expectedEvents, result.events)

        verify(mockBooksUseCase, times(2)).getBooks()
        verifyNoMoreInteractions(mockBooksUseCase)
    }

    func testViewWillAppearTakeOne() {
        stub(mockBooksUseCase) { stub in
            when(stub).getBooks().thenReturn(Single.just([]))
        }

        let output = generateOutput(viewWillAppearEvents: Recorded.events(.next(300, ()), .next(400, ())))

        let result = scheduler.start {
            output.dataSource.asObservable()
        }

        let emptyDataSource = [BooksSection(title: NSLocalizedString("books.title", comment: ""), items: [])]
        let expectedEvents = [Recorded.next(300, emptyDataSource)]

        XCTAssertEqual(expectedEvents, result.events)

        verify(mockBooksUseCase).getBooks()
        verifyNoMoreInteractions(mockBooksUseCase)
    }

    func testEmptyCartError() {
        stub(mockCartUseCase) { stub in
            when(stub).createCart(for: any()).thenReturn(Single.error(CartError.empty))
        }

        stub(mockBooksUseCase) { stub in
            when(stub).getBooks().thenReturn(Single.just([]))
        }

        let output = generateOutput(didTouchCartEvents: Recorded.events(.next(300, ())))

        let result = scheduler.start {
            output.error.asObservable()
        }

        let expectedEvents = [Recorded.next(300, NSLocalizedString("cart.error.empty", comment: ""))]
        XCTAssertEqual(expectedEvents, result.events)

        verify(mockCartUseCase).createCart(for: equal(to: []))
        verifyNoMoreInteractions(mockCartUseCase)
    }

    func testUnkownError() {
        stub(mockCartUseCase) { stub in
            when(stub).createCart(for: any()).thenReturn(Single.error(TestError.networkError))
        }

        stub(mockBooksUseCase) { stub in
            when(stub).getBooks().thenReturn(Single.just([]))
        }

        let output = generateOutput(didTouchCartEvents: Recorded.events(.next(300, ())))

        let result = scheduler.start {
            output.error.asObservable()
        }

        let expectedEvents = [Recorded.next(300, NSLocalizedString("global.error.unknown", comment: ""))]
        XCTAssertEqual(expectedEvents, result.events)

        verify(mockCartUseCase).createCart(for: equal(to: []))
        verifyNoMoreInteractions(mockCartUseCase)
    }

    func testFetchingBooks() {
        stub(mockBooksUseCase) { stub in
            when(stub).getBooks().thenReturn(Single.just([]),Single.just([]))
        }

        let output = generateOutput(
            viewWillAppearEvents: Recorded.events(.next(300, ())),
            didSwipeToRefreshEvents: Recorded.events(.next(400, ())))

        let result = scheduler.start {
            output.fetchingBooks.asObservable()
        }

        let expectedEvents = [
            Recorded.next(200, false),
            Recorded.next(300, true),
            Recorded.next(300, false),
            Recorded.next(400, true),
            Recorded.next(400, false)
        ]
        XCTAssertEqual(expectedEvents, result.events)

        verify(mockBooksUseCase, times(2)).getBooks()
        verifyNoMoreInteractions(mockBooksUseCase)
    }

    func testCreatingCartSuccess() {
        let book = Book(isbn: "isbn1", title: "Title 1", price: 15, cover: "cover1")
        let cart = Cart(books: [book], amount: 10, initialAmount: 15)

        stub(mockCartUseCase) { stub in
            when(stub).createCart(for: any()).thenReturn(Single.just(cart))
        }

        stub(mockBooksUseCase) { stub in
            when(stub).getBooks().thenReturn(Single.just([book]))
        }

        stub(mockBooksNavigator) { stub in
            when(stub).toCart().thenDoNothing()
        }

        let output = generateOutput(
            didTouchCartEvents: Recorded.events(.next(400, ())),
            didSelectIndexEvents: Recorded.events(.next(300, IndexPath(row: 0, section: 0))))

        let result = scheduler.start {
            output.creatingCart.asObservable()
        }

        let expectedEvents = [
            Recorded.next(200, false),
            Recorded.next(400, true),
            Recorded.next(400, false)
        ]
        XCTAssertEqual(expectedEvents, result.events)

        verify(mockBooksUseCase).getBooks()
        verifyNoMoreInteractions(mockBooksUseCase)
        verify(mockCartUseCase).createCart(for: equal(to: [book]))
        verify(mockBooksNavigator).toCart()
    }

    func testUnselect() {
        let books = Fixtures.getBooks()
        stub(mockCartUseCase) { stub in
            when(stub).createCart(for: any()).thenReturn(Single.error(CartError.empty))
        }

        stub(mockBooksUseCase) { stub in
            when(stub).getBooks().thenReturn(Single.just(books))
        }

        _ = generateOutput(
            didTouchCartEvents: Recorded.events(.next(600, ())),
            didSelectIndexEvents: Recorded.events(.next(300, IndexPath(row: 0, section: 0)),
                                                  .next(400, IndexPath(row: 1, section: 0))),
            didDeselectIndexEvents: Recorded.events(.next(500, IndexPath(row: 0, section: 0))))

        scheduler.start()

        verify(mockBooksUseCase).getBooks()
        verifyNoMoreInteractions(mockBooksUseCase)
        verify(mockCartUseCase).createCart(for: equal(to: [books[1]]))
    }

    // MARK: Utils

    func generateOutput(viewWillAppearEvents: [Recorded<Event<Void>>] = Recorded.events(.next(300, ())),
                        didSwipeToRefreshEvents: [Recorded<Event<Void>>] = [],
                        didTouchCartEvents: [Recorded<Event<Void>>] = [],
                        didSelectIndexEvents: [Recorded<Event<IndexPath>>] = [],
                        didDeselectIndexEvents: [Recorded<Event<IndexPath>>] = []) -> BooksViewModel.Output {

        let viewWillAppear = scheduler.createHotObservable(viewWillAppearEvents)
        let didSwipeToRefresh = scheduler.createHotObservable(didSwipeToRefreshEvents)
        let didTouchCart = scheduler.createHotObservable(didTouchCartEvents)
        let didSelectIndex = scheduler.createHotObservable(didSelectIndexEvents)
        let didDeselectIndex = scheduler.createHotObservable(didDeselectIndexEvents)

        let input = BooksViewModel.Input(viewWillAppear: ControlEvent(events: viewWillAppear),
                                         didSwipeToRefresh: ControlEvent(events: didSwipeToRefresh),
                                         didTouchCart: ControlEvent(events: didTouchCart),
                                         didSelectIndex: ControlEvent(events: didSelectIndex),
                                         didDeselectIndex: ControlEvent(events: didDeselectIndex))
        return booksViewModel.transform(input: input)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

