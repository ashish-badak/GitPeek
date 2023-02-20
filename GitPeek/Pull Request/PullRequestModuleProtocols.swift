//
//  PullRequestModuleProtocols.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import Foundation

protocol PullRequestListInteractorProtocol: AnyObject {
    func fetchPullRequests(completion: @escaping PaginationCallback<PullRequest>)
    func isPaginatedRequest() -> Bool
}

protocol PullRequestListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillDisplayLastItem()
    
    func getNumberOfViewModels() -> Int
    func getViewModel(atIndex index: Int) -> PullRequestViewModel?
}

protocol PullRequestListViewProtocol: AnyObject {}
