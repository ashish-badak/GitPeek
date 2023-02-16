//
//  DataExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 16/02/23.
//

import Foundation

extension Data {
    var dictionary: [String: Any]? {
        try? JSONSerialization.jsonObject(with: self) as? [String: Any]
    }
}
