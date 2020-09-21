//
//  CartUseCaseImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxSwift

class CartUseCaseImplementation: CartUseCase {

    private let booksRepository: BooksRepository
    private let cartRepository: CartRepository

    init(booksRepository: BooksRepository,
         cartRepository: CartRepository) {
        self.booksRepository = booksRepository
        self.cartRepository = cartRepository
    }

    func createCart(for books: [Book]) -> Single<Cart> {

        /** Check if there is at least one selected `Book` */
        if books.count == 0 {
            return Single.error(CartError.empty)
        }

        let bookIds = books.map({ $0.isbn })
        return booksRepository.getCommercialOffers(for: bookIds).map { (offers) -> Cart in

            /** Calculate the global price of the books, without discount */
            let total = books.map { $0.price }.reduce(0, +)

            /** Find the best commercial offer */
            var amount = total
            offers.forEach { (offer) in
                let offerAmount = offer.amount(for: total)
                if offerAmount < amount {
                    amount = offerAmount
                }
            }

            /** Construct the final `Cart` and save it thanks to the `CartRepository` */
            let cart = Cart(books: books, amount: amount, initialAmount: total)
            self.cartRepository.save(cart: cart)

            return cart
        }
    }

    func getCart() -> Single<Cart?> {
        return Single.just(cartRepository.load())
    }
}
