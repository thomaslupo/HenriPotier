//
//  BooksUseCaseImplementation.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxSwift

class BooksUseCaseImplementation: BooksUseCase {
    private let booksRepository: BooksRepository

    init(booksRepository: BooksRepository) {
        self.booksRepository = booksRepository
    }

    func getBooks() -> Single<[Book]> {
        return booksRepository.getBooks()
    }
}
