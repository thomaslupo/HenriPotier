//
//  Book.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

struct Book: Codable, Equatable {
    let isbn: String
    let title: String
    let price: Double
    let cover: String
}
