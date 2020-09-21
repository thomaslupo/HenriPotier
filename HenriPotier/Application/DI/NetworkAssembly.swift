//
//  NetworkAssembly.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Swinject
import Moya

class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BooksNetwork.self) { resolver in
            BooksNetworkImplementation(provider: MoyaProvider<BooksService>())
        }
    }
}
