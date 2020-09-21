//
//  BooksRepository.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxSwift

protocol BooksRepository {
    func getBooks() -> Single<[Book]>

    func getCommercialOffers(for bookIds: [String]) -> Single<[CommercialOffer]>
}
