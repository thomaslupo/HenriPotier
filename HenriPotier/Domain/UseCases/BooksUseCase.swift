//
//  BooksUseCase.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxSwift

protocol BooksUseCase {
    func getBooks() -> Single<[Book]>
}
