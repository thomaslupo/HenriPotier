//
//  RemoteBook.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

/** Represents a `Book` entity sent by the API */
struct RemoteBook: Codable, Equatable {
    let isbn: String
    let title: String
    let price: Double
    let cover: String

    func toDomain() -> Book {
        return Book(isbn: isbn,
                    title: title,
                    price: price,
                    cover: cover)
    }
}
