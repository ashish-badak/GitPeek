//
//  HTTPHeader.swift
//  GitPeek
//
//  Created by Ashish Badak on 21/02/23.
//

import Foundation

struct HTTPHeader {
    var key: String
    var value: String
}

extension HTTPHeader {
    static var authorization: Self {
        .init(key: "Authorization", value: "Bearer \(Constants.apiKey)")
    }
    
    static var contentType: Self {
        .init(key: "Accept", value: Constants.contentType)
    }
    
    static var apiVersion: Self {
        .init(key: "X-GitHub-Api-Version", value: Constants.apiVersion)
    }
}
