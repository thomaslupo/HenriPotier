//
//  CartRepositoryTests.swift
//  HenriPotierTests
//
//  Created by Thomas Lupo on 24/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import XCTest
@testable import HenriPotier

class CartRepositoryTests: XCTestCase {

    var cartRepository: CartRepository!

    override func setUpWithError() throws {
        cartRepository = CartRepositoryImplementation()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadNoCart() {
        XCTAssertNil(cartRepository.load())
    }

    func testSave() {
        XCTAssertNil(cartRepository.load())

        let cart = Fixtures.getCart()
        cartRepository.save(cart: cart)

        XCTAssertEqual(cartRepository.load(), cart)
    }
}
