//
//  PaginatedQueryParamsProvider.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

class PaginatedQueryParamsProvider: QueryParamsProvider {
    var page: Int
    
    init(page: Int) {
        self.page = page
    }
    
    enum Keys {
        static var page: String { "page" }
    }
    
    func getQueryParameters() -> Parameters {
        return [Keys.page: page]
    }
}
