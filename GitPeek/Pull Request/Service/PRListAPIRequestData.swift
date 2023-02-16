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
        let queryParams = PaginatedQueryParamsProvider(page: page)
        return queryParams.data?.dictionary ?? [:]
    }
    
    let repo: String
    let owner: String
    let page: Int
}
