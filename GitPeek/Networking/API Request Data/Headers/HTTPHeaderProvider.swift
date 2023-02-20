//
//  HTTPHeaderProvider.swift
//  GitPeek
//
//  Created by Ashish Badak on 21/02/23.
//

import Foundation

typealias HTTPHeaders = [String: String]
protocol HTTPHeaderProvider {
    func getHeaders() -> HTTPHeaders
}

struct DefaultHeaderProvider: HTTPHeaderProvider {
    func getHeaders() -> HTTPHeaders {
        [
            HTTPHeader.authorization.key: HTTPHeader.authorization.value,
            HTTPHeader.apiVersion.key: HTTPHeader.apiVersion.value,
            HTTPHeader.contentType.key: HTTPHeader.contentType.value
        ]
    }
}
