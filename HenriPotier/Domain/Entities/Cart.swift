//
//  Cart.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

struct Cart: Codable, Equatable {
    let books: [Book]
    let amount: Double
    let initialAmount: Double

    var discount: Double {
        get {
            return initialAmount - amount
        }
    }
}
