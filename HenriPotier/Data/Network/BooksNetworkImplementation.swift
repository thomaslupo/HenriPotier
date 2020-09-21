//
//  BooksNetworkImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class BooksNetworkImplementation: BooksNetwork {

    private let provider: MoyaProvider<BooksService>

    init(provider: MoyaProvider<BooksService>) {
        self.provider = provider
    }

    func getBooks() -> Single<[RemoteBook]> {
        return provider.rx
            .request(.books)
            .map([RemoteBook].self)
    }

    func getCommercialOffers(for bookIds: [String]) -> Single<[RemoteCommercialOffer]> {
        return provider.rx
            .request(.commercialOffers(bookIds: bookIds))
            .map([RemoteCommercialOffer].self, atKeyPath: "offers")
    }
}
