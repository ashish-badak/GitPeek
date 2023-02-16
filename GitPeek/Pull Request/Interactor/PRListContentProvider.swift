//
//  PRListContentProvider.swift
//  GitPeek
//
//  Created by Ashish Badak on 17/02/23.
//

import Foundation

final class PRListContentProvider: PaginationCompatibleContentProvider {
    typealias Item = PullRequest
    private let repo: String
    private let owner: String
    private let pullRequestState: PullRequest.State?
    let requestManager: PRListAPIRequestManager
    
    init(
        requestManager: PRListAPIRequestManager = PRListAPIRequestManager(),
        repo: String,
        owner: String,
        pullRequestState: PullRequest.State? = nil
    ) {
        self.requestManager = requestManager
        self.repo = repo
        self.owner = owner
        self.pullRequestState = pullRequestState
    }

    func fetchNextPage(page: Int, completion: @escaping PaginationCallback<PullRequest>) {
        requestManager.fetchPRListFrom(
            repo: repo,
            ownedBy: owner,
            page: page,
            then: completion
        )
    }
}
