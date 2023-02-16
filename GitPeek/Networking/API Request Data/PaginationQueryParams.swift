//
//  PaginationQueryParams.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

class PaginationQueryParams: Encodable {
    var page: Int
    
    init(page: Int) {
        self.page = page
    }
}
