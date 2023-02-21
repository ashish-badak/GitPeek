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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PullRequestTableViewCell.self)
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
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
    func showLoading() {
        // - TODO: Show activity indicator
    }
    
    func hideLoading() {
        // - TODO: Hide activity indicator
    }
    
    func showPullRequests() {
        // - TODO: Reload table view
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(message: String) {
        // - TODO: Show Error View
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
