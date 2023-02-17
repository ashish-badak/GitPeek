//
//  PRListAPIRequestQueryParams.swift
//  GitPeek
//
//  Created by Ashish Badak on 17/02/23.
//

import Foundation

enum PRFetchState: String, Encodable {
    case open, closed, all
}

final class PRListAPIRequestQueryParams: PaginationQueryParams {
    let state: PRFetchState?
    
    init(page: Int, state: PRFetchState? = nil) {
        self.state = state
        super.init(page: page)
    }
}
