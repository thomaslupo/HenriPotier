//
//  BooksSection.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 23/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxDataSources

struct BooksSection: Equatable {
    var title: String
    var items: [BookUI]
}

extension BooksSection: AnimatableSectionModelType {

    var identity: String {
        return title
    }

    init(original: BooksSection, items: [BookUI]) {
        self = original
        self.items = items
    }
}
