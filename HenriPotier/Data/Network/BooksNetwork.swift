//
//  BooksNetwork.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxSwift

protocol BooksNetwork {
    func getBooks() -> Single<[RemoteBook]>

    func getCommercialOffers(for bookIds: [String]) -> Single<[RemoteCommercialOffer]>
}
