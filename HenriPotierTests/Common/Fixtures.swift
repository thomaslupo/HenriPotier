//
//  Fixtures.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 24/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
@testable import HenriPotier

class Fixtures {

    static func getCart() -> Cart {
        return Cart(books: Fixtures.getBooks(), amount: 75.0, initialAmount: 100)
    }

    static func getRemoteCommercialOffers() -> [RemoteCommercialOffer] {
        let commercialOffer1 = RemoteCommercialOffer(type: .minus, value: 10, sliceValue: nil)
        let commercialOffer2 = RemoteCommercialOffer(type: .percentage, value: 20, sliceValue: nil)
        let commercialOffer3 = RemoteCommercialOffer(type: .slice, value: 50, sliceValue: 5)

        return [commercialOffer1, commercialOffer2, commercialOffer3]
    }

    static func getCommercialOffers() -> [CommercialOffer] {
        let commercialOffer1 = CommercialOffer(type: .minus, value: 10, sliceValue: nil)
        let commercialOffer2 = CommercialOffer(type: .percentage, value: 20, sliceValue: nil)
        let commercialOffer3 = CommercialOffer(type: .slice, value: 50, sliceValue: 5)

        return [commercialOffer1, commercialOffer2, commercialOffer3]
    }

    static func getRemoteBooks() -> [RemoteBook] {
        let book1 = RemoteBook(isbn: "c8fabf68-8374-48fe-a7ea-a00ccd07afff",
                               title: "Henri Potier à l'école des sorciers",
                               price: 35,
                               cover: "http://henri-potier.xebia.fr/hp0.jpg")

        let book2 = RemoteBook(isbn: "a460afed-e5e7-4e39-a39d-c885c05db861",
                               title: "Henri Potier et la Chambre des secrets",
                               price: 30,
                               cover: "http://henri-potier.xebia.fr/hp1.jpg")

        let book3 = RemoteBook(isbn: "fcd1e6fa-a63f-4f75-9da4-b560020b6acc",
                               title: "Henri Potier et le Prisonnier d'Azkaban",
                               price: 30,
                               cover: "http://henri-potier.xebia.fr/hp2.jpg")

        return [book1, book2, book3]
    }

    static func getBooks() -> [Book] {
        let book1 = Book(isbn: "c8fabf68-8374-48fe-a7ea-a00ccd07afff",
                         title: "Henri Potier à l'école des sorciers",
                         price: 35,
                         cover: "http://henri-potier.xebia.fr/hp0.jpg")

        let book2 = Book(isbn: "a460afed-e5e7-4e39-a39d-c885c05db861",
                         title: "Henri Potier et la Chambre des secrets",
                         price: 30,
                         cover: "http://henri-potier.xebia.fr/hp1.jpg")

        let book3 = Book(isbn: "fcd1e6fa-a63f-4f75-9da4-b560020b6acc",
                         title: "Henri Potier et le Prisonnier d'Azkaban",
                         price: 30,
                         cover: "http://henri-potier.xebia.fr/hp2.jpg")

        return [book1, book2, book3]
    }
}
