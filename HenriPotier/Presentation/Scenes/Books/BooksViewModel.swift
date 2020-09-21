//
//  BooksViewModel.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BooksViewModel: ViewModelType {

    struct Input {
        let viewWillAppear: ControlEvent<Void>
        let didSwipeToRefresh: ControlEvent<()>
        let didTouchCart: ControlEvent<Void>
        let didSelectIndex: ControlEvent<IndexPath>
        let didDeselectIndex: ControlEvent<IndexPath>
    }

    struct Output {
        let dataSource: Driver<[BooksSection]>
        let error: Driver<String>
        let fetchingBooks: Driver<Bool>
        let creatingCart: Driver<Bool>
    }

    private let disposeBag = DisposeBag()
    private let booksUseCase: BooksUseCase
    private let cartUseCase: CartUseCase
    private let booksNavigator: BooksNavigator

    private var selectedBooks: [Book] = []

    init(booksUseCase: BooksUseCase,
         cartUseCase: CartUseCase,
         booksNavigator: BooksNavigator) {
        self.booksUseCase = booksUseCase
        self.cartUseCase = cartUseCase
        self.booksNavigator = booksNavigator
    }

    func transform(input: Input) -> Output {

        let fetchingBooksIndicator = ActivityIndicator()
        let creatingCartIndicator = ActivityIndicator()

        /** Construct the books data source */
        let books = Observable.merge(input.viewWillAppear.take(1),
                                     input.didSwipeToRefresh.asObservable())
            .flatMapLatest { _ in
                self.booksUseCase.getBooks()
                    .trackActivity(fetchingBooksIndicator)
                    .asObservable()
                    .materialize() }
            .compactMap { $0.element }
            .share()

        let didTouchCart = input.didTouchCart.flatMapLatest { _ in
            return self.cartUseCase.createCart(for: self.selectedBooks)
                .trackActivity(creatingCartIndicator)
                .asObservable()
                .materialize() }
            .share()

        /** Manage cart creation success */
        didTouchCart.compactMap { $0.element }.do(onNext: { _ in
            self.booksNavigator.toCart()
        }).subscribe().disposed(by: disposeBag)

        /** Build `UITableView` data source */
        let dataSource = books.map { (books) -> [BooksSection] in
            let items = books.map { BookUI(book: $0) }
            return [BooksSection(title: NSLocalizedString("books.title", comment: ""), items: items)]
        }.asDriver(onErrorJustReturn: [])

        /** Manage cart creation error */
        let error = didTouchCart
            .compactMap { $0.error }
            .map { self.message(for: $0) }
            .asDriver(onErrorJustReturn: NSLocalizedString("global.error.unknown", comment: ""))

        /** Select book */
        input.didSelectIndex.withLatestFrom(books) { (indexPath, books) -> Void in
            let book = books[indexPath.row]
            self.selectedBooks.append(book)
        }.subscribe().disposed(by: disposeBag)

        /** Unselect book */
        input.didDeselectIndex.withLatestFrom(books) { (indexPath, books) -> Void in
            let book = books[indexPath.row]
            if let index = self.selectedBooks.firstIndex(where: { $0.isbn == book.isbn }) {
                self.selectedBooks.remove(at: index)
            }
        }.subscribe().disposed(by: disposeBag)

        return Output(dataSource: dataSource,
                      error: error,
                      fetchingBooks: fetchingBooksIndicator.asDriver(onErrorJustReturn: false),
                      creatingCart: creatingCartIndicator.asDriver(onErrorJustReturn: false))
    }

    func message(for error: Error) -> String {
        switch error {
        case CartError.empty:
            return NSLocalizedString("cart.error.empty", comment: "")
        default:
            return NSLocalizedString("global.error.unknown", comment: "")
        }
    }
}
