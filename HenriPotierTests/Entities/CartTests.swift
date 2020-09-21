//
//  CartTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 25/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
@testable import HenriPotier

class CartTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDiscount() {
        let cart = Cart(books: Fixtures.getBooks(), amount: 20, initialAmount: 25)
        XCTAssertEqual(cart.discount, 5)
    }

}
