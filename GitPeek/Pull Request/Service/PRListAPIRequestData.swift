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
    var queryParams: PaginatedQueryParamsProvider { .init(page: page) }
    var parameters: Parameters { queryParams.getQueryParameters() }
    
    let owner: String
    let repoName: String
    let page: Int
}
