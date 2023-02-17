//
//  PullRequestModuleProtocols.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import Foundation

// - TODO: Define contracts

protocol PullRequestListInteractorProtocol: AnyObject {
    func fetchPullRequests(completion: @escaping PaginationCallback<PullRequest>)
}

protocol PullRequestListPresenterProtocol: AnyObject {}

protocol PullRequestListViewProtocol: AnyObject {}
