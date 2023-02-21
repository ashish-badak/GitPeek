//
//  PullRequestListViewController.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import UIKit

class PullRequestListViewController: UIViewController {
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PullRequestTableViewCell.self)
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var loadingView: LoadingView = {
        LoadingView(
            frame: CGRect(
                origin: .zero,
                size: CGSize(
                    width: view.frame.width,
                    height: 100
                )
            )
        )
    }()
    
    private let presenter: PullRequestListPresenterProtocol
    
    init(presenter: PullRequestListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(PullRequestTableViewCell.reuseId)
        setupView()
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.layoutConstraints(to: view)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension PullRequestListViewController: PullRequestListViewProtocol {
    func showLoading(isPaginated: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if isPaginated {
                self.tableView.tableFooterView = self.loadingView
                
            } else {
                self.loadingView.center = self.view.center
                self.view.addSubview(self.loadingView)
            }
        }
    }
    
    func hideLoading(isPaginated: Bool) {
        DispatchQueue.main.async { [weak self] in
            if isPaginated {
                self?.tableView.tableFooterView = UIView()
            } else {
                self?.loadingView.removeFromSuperview()
            }
        }
    }
    
    func showPullRequests() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showNewPullRequests(newStartIndex: Int, newEndIndex: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let indexPaths: [IndexPath] = (newStartIndex...newEndIndex).map {
                IndexPath(row: $0, section: 0)
            }
            self.tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }

    func showError(message: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let errorController = ErrorStateViewController(errorMessage: message)
            self.add(
                childViewController: errorController,
                parentView: self.view
            )
        }
    }
}

extension PullRequestListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfViewModels()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PullRequestTableViewCell = tableView.dequeue(forIndexPath: indexPath)
        if let viewModel = presenter.getViewModel(atIndex: indexPath.item) {
            cell.setData(viewModel)
        }
        return cell
    }
}

extension PullRequestListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItemIndex = presenter.getNumberOfViewModels() - 1
        if lastItemIndex == indexPath.item {
            presenter.viewWillDisplayLastItem()
        }
    }
}
