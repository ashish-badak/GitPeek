//
//  URLExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

extension URL {
    enum GP {
        static var baseURL: URL { URL(string: "https://api.github.com")! }
    }
    
    func resized(withSize size: CGFloat) -> URL {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
        else {
            return self
        }
        
        urlComponents.append(queryParams: ["s": Int(size)])
        return urlComponents.url ?? self
    }
}


extension URLComponents {
    mutating func append(queryParams: Parameters) {
        let newQueryItems = queryParams.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        var existingQueryItems: [URLQueryItem] = self.queryItems ?? []
        existingQueryItems.append(contentsOf: newQueryItems)
        queryItems = existingQueryItems
    }
}

extension URLRequest {
    func log() {
        print("Request URL: \(url?.absoluteString ?? "")")
        print("Request HTTP Method: \(httpMethod ?? "")")
        print("Request Headers: \(allHTTPHeaderFields ?? [:])")
    }
}
