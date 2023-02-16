//
//  PRListAPIRequestQueryParams.swift
//  GitPeek
//
//  Created by Ashish Badak on 17/02/23.
//

import Foundation

final class PRListAPIRequestQueryParams: PaginationQueryParams {
    let state: PullRequest.State?
    
    init(page: Int, state: PullRequest.State? = nil) {
        self.state = state
        super.init(page: page)
    }
}
