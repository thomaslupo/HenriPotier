//
//  BooksNavigator.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import UIKit
import Swinject

protocol BooksNavigator {
    func start()
    func toCart()
}

class BooksNavigatorImplementation: BooksNavigator {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }

        let booksViewController = Assembler.sharedAssembler.resolver.resolve(BooksViewController.self)!
        navigationController.viewControllers = [booksViewController]
        window?.rootViewController = navigationController
    }

    func toCart() {
        let cartViewController = Assembler.sharedAssembler.resolver.resolve(CartViewController.self)!
        navigationController.pushViewController(cartViewController, animated: true)
    }
}
