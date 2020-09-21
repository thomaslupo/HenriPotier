//
//  CommercialOfferType.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

/**
 Represents the type of `CommercialOffer`
 - `percentage` will a apply a global percentage discount on the cart
 - `minus` will remove a fixed discount amount from the cart's total
 - `slice` will remove a fixed amount for every reached silce (ex: Remove $10 for every $100) from the cart's total
 */
enum CommercialOfferType: String, Codable {
    case percentage
    case minus
    case slice
}
