//
//  CartViewModel.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CartViewModel: ViewModelType {
    
    struct Input {
        let viewWillAppear: ControlEvent<Void>
    }

    struct Output {
        let books: Driver<[BookUI]>
        let cart: Driver<CartUI?>
    }

    private let cartUseCase: CartUseCase

    init(cartUseCase: CartUseCase) {
        self.cartUseCase = cartUseCase
    }

    func transform(input: Input) -> Output {

        let cartObservable = input.viewWillAppear
            .take(1)
            .flatMapLatest { _ in
                self.cartUseCase.getCart() }
            .share()

        let books = cartObservable.map { (cart) -> [BookUI] in
            return cart?.books.map { BookUI(book: $0) } ?? []
        }.asDriver(onErrorJustReturn: [])

        let cart = cartObservable.map { (cart) -> CartUI? in
            guard let cart = cart else { return nil }
            return CartUI(cart: cart)
        }.asDriver(onErrorJustReturn: nil)

        return Output(books: books, cart: cart)
    }
}
