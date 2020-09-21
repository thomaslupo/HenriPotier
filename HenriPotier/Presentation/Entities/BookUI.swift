//
//  BookUI.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxDataSources

struct BookUI: Equatable, IdentifiableType {
    let isbn: String
    let title: String
    let cover: String
    let price: String

    var identity: String {
        return isbn
    }

    init(book: Book) {
        self.isbn = book.isbn
        self.title = book.title
        self.cover = book.cover
        self.price = String(format: NSLocalizedString("book.price", comment: ""), book.price)
    }
}
