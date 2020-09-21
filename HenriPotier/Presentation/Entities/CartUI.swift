//
//  CartUI.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

struct CartUI: Equatable {
    let amount: String
    let initialAmount: String
    let discount: String

    init(cart: Cart) {

        let amountValue = String(format: NSLocalizedString("cart.amount.value", comment: ""), cart.amount)
        self.amount = "\(NSLocalizedString("cart.amount.title", comment: "")) \(amountValue)"

        let initialAmountValue = String(format: NSLocalizedString("cart.initialAmount.value", comment: ""), cart.initialAmount)
        self.initialAmount = "\(NSLocalizedString("cart.initialAmount.title", comment: "")) \(initialAmountValue)"

        let discountValue = String(format: NSLocalizedString("cart.discount.value", comment: ""), cart.discount)
        self.discount = "\(NSLocalizedString("cart.discount.title", comment: "")) \(discountValue)"
    }
}
