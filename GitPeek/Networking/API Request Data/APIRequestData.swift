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
    
    var parameters: Parameters { get }
    var encoder: ParameterEncoder { get }
}

extension APIRequestData {
    var baseURL: URL { URL.GP.baseURL }
}

protocol GetAPIRequestData: APIRequestData {}

extension GetAPIRequestData {
    var httpMethod: HTTPMethod { .get }
    var encoder: ParameterEncoder { URLParameterEncoder() }
}
