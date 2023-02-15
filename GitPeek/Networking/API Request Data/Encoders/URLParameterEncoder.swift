//
//  URLParameterEncoder.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

struct URLParameterEncoder: ParameterEncoder {
    func encode(
        urlRequest: inout URLRequest,
        with parameters: Parameters
    ) throws {
        if parameters.isEmpty {
            return
        }
        
        guard let url = urlRequest.url,
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            throw APIRequestError.invalidURL
        }

        urlComponents.queryItems = parameters.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        urlRequest.url = urlComponents.url
    }
}

