//
//  CartUseCaseTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 25/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import Cuckoo
@testable import HenriPotier

class CartUseCaseTests: XCTestCase {

    var cartUseCase: CartUseCase!
    
    var mockCartRepository: MockCartRepository!
    var mockBooksRepository: MockBooksRepository!

    override func setUpWithError() throws {
        mockCartRepository = MockCartRepository()
        mockBooksRepository = MockBooksRepository()

        cartUseCase = CartUseCaseImplementation(booksRepository: mockBooksRepository, cartRepository: mockCartRepository)
    }

    // MARK: createCart

    func testCreateCartNoBook() {
        XCTAssertThrowsError(try cartUseCase.createCart(for: []).toBlocking().first()) { error in
            XCTAssertEqual(error as? CartError, CartError.empty)
        }
    }

    func testCreateCartSuccess() {
        let offer1 = CommercialOffer(type: .minus, value: 10, sliceValue: nil)
        let offer2 = CommercialOffer(type: .percentage, value: 20, sliceValue: nil)

        stub(mockBooksRepository) { stub in
            when(stub).getCommercialOffers(for: any()).thenReturn(Single.just([offer1, offer2]))
        }

        stub(mockCartRepository) { stub in
            when(stub).save(cart: any()).thenDoNothing()
        }

        let books = [
            Book(isbn: "isbn1", title: "Title 1", price: 10, cover: "cover1"),
            Book(isbn: "isbn2", title: "Title2", price: 50, cover: "cover2")
        ]
        let cart = try? cartUseCase.createCart(for: books).toBlocking().first()
        let expectedCart = Cart(books: books, amount: 48.0, initialAmount: 60.0)

        XCTAssertEqual(cart, expectedCart)

        verify(mockBooksRepository).getCommercialOffers(for: equal(to: ["isbn1", "isbn2"]))
        verifyNoMoreInteractions(mockBooksRepository)

        verify(mockCartRepository).save(cart: equal(to: expectedCart))
        verifyNoMoreInteractions(mockCartRepository)
    }

    func testCreateCartError() {
        stub(mockBooksRepository) { stub in
            when(stub).getCommercialOffers(for: any()).thenReturn(Single.error(TestError.decodingError))
        }

        let books = Fixtures.getBooks()
        XCTAssertThrowsError(try cartUseCase.createCart(for: books).toBlocking().first()) { error in
            XCTAssertEqual(error as? TestError, TestError.decodingError)
        }

        verify(mockBooksRepository).getCommercialOffers(for: equal(to: books.map { $0.isbn }))
        verifyNoMoreInteractions(mockBooksRepository)
    }

    // MARK: getCart

    func testGetCartNil() {
        stub(mockCartRepository) { stub in
            when(stub).load().thenReturn(nil)
        }

        let cart = try? cartUseCase.getCart().toBlocking().first() ?? nil
        XCTAssertEqual(cart, nil)
    }

    func testGetCart() {
        let expectedCart = Cart(books: Fixtures.getBooks(), amount: 40.0, initialAmount: 50.0)

        stub(mockCartRepository) { stub in
            when(stub).load().thenReturn(expectedCart)
        }

        let cart = try? cartUseCase.getCart().toBlocking().first()
        XCTAssertEqual(cart, expectedCart)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
