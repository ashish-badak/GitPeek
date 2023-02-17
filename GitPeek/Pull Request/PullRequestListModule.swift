//
//  PullRequestListModule.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import UIKit

final class PullRequestListModule {
    func build(
        repo: String = "swift",
        owner: String = "apple",
        pullRequestState: PRFetchState = .closed
    ) -> UIViewController {
        /// - NOTE: Router is not created as it is not needed for current use case.
        
        let contentProvider = PRListContentProvider(
            repo: repo,
            owner: owner,
            pullRequestState: pullRequestState
        )
        
        let interactor = PullRequestListInteractor(contentProvider: contentProvider)
        let presenter = PullRequestListPresenter(interactor: interactor)
        let viewController = PullRequestListViewController(presenter: presenter)
        
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
