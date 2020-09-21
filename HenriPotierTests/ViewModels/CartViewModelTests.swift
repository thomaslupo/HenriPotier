//
//  CartViewModelTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 25/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import Cuckoo
@testable import HenriPotier

class CartViewModelTests: XCTestCase {

    var scheduler: TestScheduler!

    var cartViewModel: CartViewModel!

    var mockCartUseCase: MockCartUseCase!

    override func setUpWithError() throws {
        scheduler = TestScheduler(initialClock: 0)

        mockCartUseCase = MockCartUseCase()

        cartViewModel = CartViewModel(cartUseCase: mockCartUseCase)
    }

    func testViewWillAppearTakeOne() {
        let cart = Fixtures.getCart()

        stub(mockCartUseCase) { stub in
            when(stub).getCart().thenReturn(Single.just(cart))
        }

        let output = generateOutput(viewWillAppearEvents: Recorded.events(.next(300, ()), .next(400, ())))

        let expectedBooks = cart.books.map { BookUI(book: $0) }

        let result = scheduler.start {
            output.books.asObservable()
        }

        let expectedEvents = [Recorded.next(300, expectedBooks), Recorded.completed(300)]
        XCTAssertEqual(result.events, expectedEvents)

        verify(mockCartUseCase).getCart()
        verifyNoMoreInteractions(mockCartUseCase)
    }

    func testBooks() {
        let cart = Fixtures.getCart()

        stub(mockCartUseCase) { stub in
            when(stub).getCart().thenReturn(Single.just(cart))
        }

        let output = generateOutput()

        let expectedBooks = cart.books.map { BookUI(book: $0) }

        let result = scheduler.start {
            output.books.asObservable()
        }

        let expectedEvents = [Recorded.next(300, expectedBooks), Recorded.completed(300)]
        XCTAssertEqual(result.events, expectedEvents)

        verify(mockCartUseCase).getCart()
        verifyNoMoreInteractions(mockCartUseCase)
    }

    func testBooksEmpty() {
        stub(mockCartUseCase) { stub in
            when(stub).getCart().thenReturn(Single.just(nil))
        }

        let output = generateOutput()

        let result = scheduler.start {
            output.books.asObservable()
        }

        let expectedEvents: [Recorded<Event<[BookUI]>>] = [Recorded.next(300, []), Recorded.completed(300)]
        XCTAssertEqual(result.events, expectedEvents)

        verify(mockCartUseCase).getCart()
        verifyNoMoreInteractions(mockCartUseCase)
    }

    func testCart() {
        let cart = Fixtures.getCart()

        stub(mockCartUseCase) { stub in
            when(stub).getCart().thenReturn(Single.just(cart))
        }

        let output = generateOutput()

        let expectedCartUI = CartUI(cart: cart)

        let result = scheduler.start {
            output.cart.asObservable()
        }

        let expectedEvents: [Recorded<Event<CartUI?>>] = [Recorded.next(300, expectedCartUI), Recorded.completed(300)]
        XCTAssertEqual(result.events, expectedEvents)

        verify(mockCartUseCase).getCart()
        verifyNoMoreInteractions(mockCartUseCase)
    }

    func testCartEmpty() {
        stub(mockCartUseCase) { stub in
            when(stub).getCart().thenReturn(Single.just(nil))
        }

        let output = generateOutput()

        let result = scheduler.start {
            output.cart.asObservable()
        }

        let expectedEvents: [Recorded<Event<CartUI?>>] = [Recorded.next(300, nil), Recorded.completed(300)]
        XCTAssertEqual(result.events, expectedEvents)

        verify(mockCartUseCase).getCart()
        verifyNoMoreInteractions(mockCartUseCase)
    }

    // MARK: Utils

    func generateOutput(viewWillAppearEvents: [Recorded<Event<Void>>] = Recorded.events(.next(300, ()))) -> CartViewModel.Output {

        let viewWillAppear = scheduler.createHotObservable(viewWillAppearEvents)

        let input = CartViewModel.Input(viewWillAppear: ControlEvent(events: viewWillAppear))

        return cartViewModel.transform(input: input)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
