//
//  PaginationQueryParams.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

class PaginationQueryParams: Encodable {
    let page: Int
    let pageSize: Int
    static let defaultPageSize: Int = 10
    
    init(page: Int, pageSize: Int = PaginationQueryParams.defaultPageSize) {
        self.page = page
        self.pageSize = pageSize
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case pageSize = "per_page"
    }
}
