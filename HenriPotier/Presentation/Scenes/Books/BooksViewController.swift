//
//  BooksViewController.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class BooksViewController: UIViewController {

    private let disposeBag = DisposeBag()

    var viewModel: BooksViewModel!

    @IBOutlet weak var tableView: UITableView!

    private let refreshControl = UIRefreshControl()
    private let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .done, target: nil, action: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        bindViewModel()
    }

    func setupView() {
        title = NSLocalizedString("books.title", comment: "")
        navigationItem.rightBarButtonItem = cartButton
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 107
        tableView.register(UINib(nibName: Constants.CellIdentifiers.Book, bundle: nil),
                           forCellReuseIdentifier: Constants.CellIdentifiers.Book)

        refreshControl.layer.zPosition = -1
        tableView.refreshControl = refreshControl
    }

    func bindViewModel() {
        let didSwipeToRefresh = refreshControl.rx.controlEvent(.valueChanged)

        let input = BooksViewModel.Input(viewWillAppear: rx.viewWillAppear,
                                         didSwipeToRefresh: didSwipeToRefresh,
                                         didTouchCart: cartButton.rx.tap,
                                         didSelectIndex: tableView.rx.itemSelected,
                                         didDeselectIndex: tableView.rx.itemDeselected)

        let output = viewModel.transform(input: input)

        output.dataSource.drive(self.tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)

        output.error.drive(onNext: { [unowned self] (error) in
            self.manageError(error)
        }).disposed(by: disposeBag)

        output.fetchingBooks
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)

        output.creatingCart.drive(onNext: { [unowned self] (loading) in
            self.manageNavigationItem(loading: loading)
        }).disposed(by: disposeBag)
    }

    func manageError(_ error: String) {
        let alert = UIAlertController(title: NSLocalizedString("global.app.name", comment: ""),
                                      message: error,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("global.ok", comment: ""), style: .default, handler: nil))
        present(alert, animated: true)
    }

    func manageNavigationItem(loading: Bool) {
        if loading {
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: 24.0, height: 24.0))
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
            activityIndicator.startAnimating()

        } else {
            navigationItem.rightBarButtonItem = cartButton
        }
    }

    private lazy var dataSource = RxTableViewSectionedAnimatedDataSource<BooksSection>(
      configureCell: { dataSource, tableView, indexPath, item in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.Book, for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(with: item)
        return cell
    })
}
