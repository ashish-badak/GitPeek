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
    
    enum CodingKeys: String, CodingKey {
        case state
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(state, forKey: .state)
        try super.encode(to: encoder)
    }
}
