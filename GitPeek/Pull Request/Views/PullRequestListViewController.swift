//
//  PullRequestListViewController.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import UIKit

class PullRequestListViewController: UIViewController, PullRequestListViewProtocol {
    private let presenter: PullRequestListPresenterProtocol
    
    init(presenter: PullRequestListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // - TODO: Define view components

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // - TODO: Configure views
}
