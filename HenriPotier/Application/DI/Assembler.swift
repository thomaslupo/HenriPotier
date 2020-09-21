//
//  Assembler.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()

        let assembler = Assembler(
            [
                NetworkAssembly(),
                RepositoryAssembly(),
                UseCaseAssembly(),
                ViewModelAssembly(),
                ViewControllerAssembly(),
                NavigatorAssembly()
            ],
            container: container)

        return assembler
    }()
}
