//
//  APIRequestData.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

typealias Parameters = [String: Any]

protocol APIRequestData {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    
    var extraHeaders: HTTPHeaders? { get }
    var parameters: Parameters { get }
    var encoder: ParameterEncoder { get }
}

extension APIRequestData {
    var baseURL: URL { URL.GP.baseURL }
    var extraHeaders: HTTPHeaders? { nil }
    
    
    func getHeaders() -> HTTPHeaders {
        var allHTTPHeaders = DefaultHeaderProvider().getHeaders()
        
        if let extraHeaders = extraHeaders, !extraHeaders.isEmpty {
            /// request specific headers can be provided in extraHeaders
            /// those shall overwrite default ones
            /// so merging by giving preference to extraHeaders (i.e. $1)
            allHTTPHeaders = allHTTPHeaders.merging(extraHeaders) { $1 }
        }
        
        return allHTTPHeaders
    }
}

protocol GetAPIRequestData: APIRequestData {}

extension GetAPIRequestData {
    var httpMethod: HTTPMethod { .get }
    var encoder: ParameterEncoder { URLParameterEncoder() }
}
