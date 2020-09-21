//
//  CartRepositoryImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

/**
 This is an "In-Memory" implementation of the `CartRepository`
 but we can imagine a "UserDefaults" implementation, a "Core Data" implementation etc.
 to manage cart restoration when relaunching the app
 */
class CartRepositoryImplementation: CartRepository {

    private var cart: Cart? = nil

    func save(cart: Cart) {
        self.cart = cart
    }

    func load() -> Cart? {
        return cart
    }
}
