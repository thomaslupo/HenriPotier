//
//  RepositoryAssembly.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Swinject
import Moya

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BooksRepository.self) { resolver in
            BooksRepositoryImplementation(network: resolver.resolve(BooksNetwork.self)!)
        }

        /**
         Example of `.container` scope use
         Our "In-Memory" implementation of the `CartRepository` needs to be shared accross the container
         to permit to save / load user's cart on various screen
         */
        container.register(CartRepository.self) { _ in
            CartRepositoryImplementation()
        }.inObjectScope(.container)
    }
}
