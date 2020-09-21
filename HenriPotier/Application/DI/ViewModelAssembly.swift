//
//  ViewModelAssembly.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BooksViewModel.self) { resolver in
            BooksViewModel(booksUseCase: resolver.resolve(BooksUseCase.self)!,
                           cartUseCase: resolver.resolve(CartUseCase.self)!,
                           booksNavigator: resolver.resolve(BooksNavigator.self)!)
        }

        container.register(CartViewModel.self) { resolver in
            CartViewModel(cartUseCase: resolver.resolve(CartUseCase.self)!)
        }
    }
}
