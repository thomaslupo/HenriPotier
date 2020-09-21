//
//  BooksNetworkTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 25/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
import Moya
import RxSwift
import RxBlocking

@testable import HenriPotier

class BooksNetworkTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: getBooks

    func testGetBooksSuccess() {
        let booksService = MoyaProvider<BooksService>(stubClosure: MoyaProvider.immediatelyStub)
        let booksNetwork = BooksNetworkImplementation(provider: booksService)
        let books = try? booksNetwork.getBooks().toBlocking().first()

        let decoder = JSONDecoder()
        let expectedBooks = try? decoder.decode([RemoteBook].self, from: BooksService.books.sampleData)

        XCTAssertEqual(books, expectedBooks)
    }

    func testGetBooksError() {
        let booksService = MoyaProvider<BooksService>(endpointClosure: errorEndpointClosure(),
                                                      stubClosure: MoyaProvider.immediatelyStub)

        let booksNetwork = BooksNetworkImplementation(provider: booksService)

        XCTAssertThrowsError(try booksNetwork.getBooks().toBlocking().first())
    }

    // MARK: getCommercialOffers

    func testGetCommercialOffersSuccess() {
        let booksService = MoyaProvider<BooksService>(stubClosure: MoyaProvider.immediatelyStub)
        let booksNetwork = BooksNetworkImplementation(provider: booksService)
        let offers = try? booksNetwork.getCommercialOffers(for: ["001"]).toBlocking().first()

        let decoder = JSONDecoder()
        let response = try? decoder.decode(RemoteCommercialOffersResponse.self,
                                           from: BooksService.commercialOffers(bookIds: ["001"]).sampleData)

        XCTAssertEqual(offers, response?.offers)
    }

    func testGetCommercialOffersError() {
        let booksService = MoyaProvider<BooksService>(endpointClosure: errorEndpointClosure(),
                                                      stubClosure: MoyaProvider.immediatelyStub)

        let booksNetwork = BooksNetworkImplementation(provider: booksService)

        XCTAssertThrowsError(try booksNetwork.getCommercialOffers(for: ["001"]).toBlocking().first())
    }

    // MARK: Utils

    func errorEndpointClosure() -> (BooksService) -> Endpoint {
        return { (target: BooksService) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(200 , Data()) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
    }
}

struct RemoteCommercialOffersResponse: Codable {
    let offers: [RemoteCommercialOffer]
}
