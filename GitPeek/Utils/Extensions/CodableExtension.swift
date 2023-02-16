//
//  CodableExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 16/02/23.
//

import Foundation

extension Encodable {
    var data: Data? { try? JSONEncoder().encode(self) }
}
