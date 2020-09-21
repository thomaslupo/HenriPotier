//
//  NavigatorAssembly.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class NavigatorAssembly: Assembly {

    private let navigationController = UINavigationController()

    func assemble(container: Container) {
        container.register(BooksNavigator.self) { _ in
            BooksNavigatorImplementation(navigationController: self.navigationController)
        }
    }
}
