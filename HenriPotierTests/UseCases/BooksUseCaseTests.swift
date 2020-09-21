//
//  BooksUseCaseTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 25/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
import Cuckoo
import RxSwift
import RxBlocking

@testable import HenriPotier

class BooksUseCaseTests: XCTestCase {

    var booksUseCase: BooksUseCase!
    var mockBooksRepository: MockBooksRepository!

    override func setUpWithError() throws {
        mockBooksRepository = MockBooksRepository()
        booksUseCase = BooksUseCaseImplementation(booksRepository: mockBooksRepository)
    }

    // MARK: getBooks

    func testGetBooksSuccess() {
        stub(mockBooksRepository) { stub in
            when(stub).getBooks().thenReturn(Single.just(Fixtures.getBooks()))
        }

        let books = try? booksUseCase.getBooks().toBlocking().first()
        XCTAssertEqual(books, Fixtures.getBooks())

        verify(mockBooksRepository).getBooks()
        verifyNoMoreInteractions(mockBooksRepository)
    }

    func testGetBooksError() {
        stub(mockBooksRepository) { stub in
            when(stub).getBooks().thenReturn(Single.error(TestError.networkError))
        }

        XCTAssertThrowsError(try booksUseCase.getBooks().toBlocking().first()) { error in
            XCTAssertEqual(error as? TestError, TestError.networkError)
        }

        verify(mockBooksRepository).getBooks()
        verifyNoMoreInteractions(mockBooksRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
