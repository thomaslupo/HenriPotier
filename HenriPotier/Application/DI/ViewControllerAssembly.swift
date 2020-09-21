//
//  ViewControllerAssembly.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Swinject

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BooksViewController.self) { resolver in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateViewController(identifier: "BooksViewController") as? BooksViewController {
                controller.viewModel = resolver.resolve(BooksViewModel.self)!
                return controller
            } else {
                fatalError("Failed to instantiate BooksViewController")
            }
        }

        container.register(CartViewController.self) { resolver in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let controller = storyboard.instantiateViewController(identifier: "CartViewController") as? CartViewController {
                controller.viewModel = resolver.resolve(CartViewModel.self)!
                return controller
            } else {
                fatalError("Failed to instantiate CartViewController")
            }
        }
    }
}
