//
//  BooksRepositoryTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 23/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
import Cuckoo

@testable import HenriPotier

class BooksRepositoryTests: XCTestCase {

    var booksRepository: BooksRepository!
    var mockBooksNetwork: MockBooksNetwork!

    override func setUpWithError() throws {
        mockBooksNetwork = MockBooksNetwork()
        booksRepository = BooksRepositoryImplementation(network: mockBooksNetwork)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: getBooks

    func testGetBooksSuccess() {
        stub(mockBooksNetwork) { stub in
            when(stub).getBooks().thenReturn(Single.just(Fixtures.getRemoteBooks()))
        }

        let books = try? booksRepository.getBooks().toBlocking().first()
        XCTAssertEqual(books, Fixtures.getBooks())

        verify(mockBooksNetwork).getBooks()
        verifyNoMoreInteractions(mockBooksNetwork)
    }

    func testGetBooksError() {
        stub(mockBooksNetwork) { stub in
            when(stub).getBooks().thenReturn(Single.error(TestError.networkError))
        }

        XCTAssertThrowsError(try booksRepository.getBooks().toBlocking().first()) { error in
            XCTAssertEqual(error as? TestError, TestError.networkError)
        }

        verify(mockBooksNetwork).getBooks()
        verifyNoMoreInteractions(mockBooksNetwork)
    }

    // MARK: getCommercialOffers

    func testGetCommercialOffersSuccess() {
        stub(mockBooksNetwork) { stub in
            when(stub).getCommercialOffers(for: any()).thenReturn(Single.just(Fixtures.getRemoteCommercialOffers()))
        }

        let offers = try? booksRepository.getCommercialOffers(for: ["001", "002"]).toBlocking().first()
        XCTAssertEqual(offers, Fixtures.getCommercialOffers())

        verify(mockBooksNetwork).getCommercialOffers(for: equal(to: ["001", "002"]))
        verifyNoMoreInteractions(mockBooksNetwork)
    }

    func testGetCommercialOffersError() {
        stub(mockBooksNetwork) { stub in
            when(stub).getCommercialOffers(for: any()).thenReturn(Single.error(TestError.decodingError))
        }

        XCTAssertThrowsError(try booksRepository.getCommercialOffers(for: ["003"]).toBlocking().first()) { error in
            XCTAssertEqual(error as? TestError, TestError.decodingError)
        }

        verify(mockBooksNetwork).getCommercialOffers(for: equal(to: ["003"]))
        verifyNoMoreInteractions(mockBooksNetwork)
    }
}
