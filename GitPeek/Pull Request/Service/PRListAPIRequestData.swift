//
//  PRListAPIRequestData.swift
//  GitPeek
//
//  Created by Ashish Badak on 16/02/23.
//

import Foundation

struct PRListAPIRequestData: GetAPIRequestData {
    var path: String {
        "repos/\(owner)/\(repoName)/pulls"
    }
    
    var parameters: Parameters {
        let queryParams = PaginatedQueryParamsProvider(page: page)
        return queryParams.data?.dictionary ?? [:]
    }
    
    let owner: String
    let repoName: String
    let page: Int
}
