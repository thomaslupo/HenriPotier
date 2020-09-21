//
//  RemoteCommercialOffer.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation

/** Represents a `CommercialOffer` entity sent by the API */
struct RemoteCommercialOffer: Codable, Equatable {
    let type: CommercialOfferType
    let value: Double
    let sliceValue: Double?

    func toDomain() -> CommercialOffer {
        return CommercialOffer(type: type,
                               value: value,
                               sliceValue: sliceValue)
    }
}
