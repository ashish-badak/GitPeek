//
//  ParameterEncoder.swift
//  GitPeek
//
//  Created by Ashish Badak on 15/02/23.
//

import Foundation

protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: [String: Any]) throws
}
