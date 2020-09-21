//
//  CommercialOfferTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 25/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
@testable import HenriPotier

class CommercialOfferTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPercentage() {
        let offer = CommercialOffer(type: .percentage, value: 10, sliceValue: nil)
        XCTAssertEqual(offer.amount(for: 300), 270)
        XCTAssertEqual(offer.amount(for: 100), 90)
        XCTAssertEqual(offer.amount(for: 20), 18)
    }

    func testMinus() {
        let offer = CommercialOffer(type: .minus, value: 5, sliceValue: nil)
        XCTAssertEqual(offer.amount(for: 300), 295)
        XCTAssertEqual(offer.amount(for: 100), 95)
        XCTAssertEqual(offer.amount(for: 20), 15)
    }

    func testSlice() {
        let offer = CommercialOffer(type: .slice, value: 10, sliceValue: 50)
        XCTAssertEqual(offer.amount(for: 300), 240)
        XCTAssertEqual(offer.amount(for: 100), 80)
        XCTAssertEqual(offer.amount(for: 20), 20)
    }
}
