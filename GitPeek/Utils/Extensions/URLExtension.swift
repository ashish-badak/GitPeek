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
}
