//
//  RequestBuilder.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

struct RequestBuilder: URLRequestConvertible {
    let reqestData: APIRequestData
    let cachePolicy: URLRequest.CachePolicy
    let timeoutInterval: TimeInterval
    
    init(
        reqestData: APIRequestData,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 10.0
    ) {
        self.cachePolicy = cachePolicy
        self.timeoutInterval = timeoutInterval
        self.reqestData = reqestData
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(
            url: reqestData.baseURL.appendingPathComponent(reqestData.path),
            cachePolicy: cachePolicy,
            timeoutInterval: timeoutInterval
        )
        
        urlRequest.httpMethod = reqestData.httpMethod.rawValue
        try reqestData.encoder.encode(
            urlRequest: &urlRequest,
            with: reqestData.parameters
        )
        return urlRequest
    }
}
