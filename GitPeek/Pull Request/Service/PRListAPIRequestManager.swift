//
//  PRListAPIRequestManager.swift
//  GitPeek
//
//  Created by Ashish Badak on 17/02/23.
//

import Foundation

struct PRListAPIRequestManager {
    private let restClient: RestClient
    
    init(restClient: RestClient = RestClient()) {
        self.restClient = restClient
    }
    
    func fetchPRListFrom(
        repo: String,
        ownedBy owner: String,
        page: Int,
        state: PRFetchState? = nil,
        then perform: @escaping (Result<[PullRequest], Error>) -> Void
    ) {
        let requestData = PRListAPIRequestData(
            repo: repo,
            owner: owner,
            page: page,
            state: state
        )
        
        restClient.get(requestData: requestData, then: perform)
    }
}
