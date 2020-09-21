//
//  CartViewController.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 22/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import UIKit
import RxSwift

class CartViewController: UIViewController {

    private let disposeBag = DisposeBag()

    var viewModel: CartViewModel!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var initialAmountLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var headerContentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        bindViewModel()
    }

    func setupView() {
        title = NSLocalizedString("cart.title", comment: "")

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 107

        tableView.register(UINib(nibName: Constants.CellIdentifiers.Book, bundle: nil),
                           forCellReuseIdentifier: Constants.CellIdentifiers.Book)

        headerContentView.layer.cornerRadius = 8.0
    }

    func bindViewModel() {
        let input = CartViewModel.Input(
            viewWillAppear: rx.viewWillAppear
        )

        let output = viewModel.transform(input: input)

        output.books.asObservable().bind(to: tableView.rx.items(cellIdentifier: Constants.CellIdentifiers.Book,
                                                                cellType: BookTableViewCell.self)) { row, element, cell in
            cell.configure(with: element)
        }.disposed(by: disposeBag)

        output.cart.drive(onNext: { [unowned self] (cart) in
            self.configureCart(cart)
        }).disposed(by: disposeBag)
    }

    func configureCart(_ cart: CartUI?) {
        guard let cart = cart else { return }

        amountLabel.text = cart.amount
        initialAmountLabel.text = cart.initialAmount
        discountLabel.text = cart.discount
    }
}
