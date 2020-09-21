//
//  CartRepository.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

protocol CartRepository {
    func save(cart: Cart)

    func load() -> Cart?
}
