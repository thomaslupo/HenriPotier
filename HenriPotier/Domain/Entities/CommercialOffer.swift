//
//  CommercialOffer.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

struct CommercialOffer: Equatable {
    let type: CommercialOfferType
    let value: Double
    let sliceValue: Double?

    /**
     Calculate a final amount from an initial amount according to the `CommercialOfferType`
     - parameter for: The initial `Double` amount
     - returns: The final amount after applying the `CommercialOffer`
     */
    func amount(for total: Double) -> Double {
        switch type {
        case .percentage:
            return total * (1 - (value / 100))
        case .minus:
            return total - value
        case .slice:
            guard let sliceValue = sliceValue, total >= sliceValue else {
                return total
            }

            let slices = floor(total / sliceValue)
            return total - (slices * value)
        }
    }
}
