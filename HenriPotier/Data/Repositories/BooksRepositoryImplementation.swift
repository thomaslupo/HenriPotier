//
//  BooksRepositoryImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxSwift

class BooksRepositoryImplementation: BooksRepository {
    private let network: BooksNetwork
    
    init(network: BooksNetwork) {
        self.network = network
    }

    func getBooks() -> Single<[Book]> {
        return network.getBooks().map { (books) -> [Book] in
            return books.map { $0.toDomain() }
        }
    }

    func getCommercialOffers(for bookIds: [String]) -> Single<[CommercialOffer]> {
        return network.getCommercialOffers(for: bookIds).map { (offers) -> [CommercialOffer] in
            return offers.map { $0.toDomain() }
        }
    }
}
