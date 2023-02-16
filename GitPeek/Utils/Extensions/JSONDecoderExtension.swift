//
//  JSONDecoderExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

extension JSONDecoder {
    static var `default`: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .iso8601
        return jsonDecoder
    }
}
