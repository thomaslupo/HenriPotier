//
//  UseCaseAssembly.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Swinject

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BooksUseCase.self) { resolver in
            BooksUseCaseImplementation(booksRepository: resolver.resolve(BooksRepository.self)!)
        }

        container.register(CartUseCase.self) { resolver in
            CartUseCaseImplementation(
                booksRepository: resolver.resolve(BooksRepository.self)!,
                cartRepository: resolver.resolve(CartRepository.self)!)
        }
    }
}
