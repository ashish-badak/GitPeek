//
//  PullRequestListInteractor.swift
//  GitPeek
//
//  Created by Ashish Badak on 14/02/23.
//

import Foundation

final class PullRequestListInteractor: PullRequestListInteractorProtocol {
    weak var presenter: PullRequestListPresenterProtocol?
    private let contentProvider: PaginatedContentProvider<PRListContentProvider>
    
    private var pullRequests: [PullRequest] = []
    
    init(contentProvider: PRListContentProvider) {
        let paginatedContentProvider = PaginatedContentProvider(contentProvider: contentProvider)
        self.contentProvider = paginatedContentProvider
    }
    
    func fetchPullRequests(completion: @escaping PaginationCallback<PullRequest>) {
        contentProvider.fetchItems { [weak self] result in
            guard let self = self else { return }
            
            if case .success(let items) = result {
                self.pullRequests.append(contentsOf: items)
            }
            
            completion(result)
        }
    }
    
    func isPaginatedRequest() -> Bool {
        contentProvider.isPaginatedRequest()
    }
}
