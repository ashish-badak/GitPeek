//
//  PRListAPIRequestData.swift
//  GitPeek
//
//  Created by Ashish Badak on 16/02/23.
//

import Foundation

struct PRListAPIRequestData: GetAPIRequestData {
    var path: String {
        "repos/\(owner)/\(repo)/pulls"
    }
    
    var parameters: Parameters {
        let queryParams = PRListAPIRequestQueryParams(page: page, state: state)
        return queryParams.data?.dictionary ?? [:]
    }
    
    let repo: String
    let owner: String
    let page: Int
    var state: PRFetchState? = nil
}
