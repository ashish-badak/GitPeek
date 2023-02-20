//
//  ArrayExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import Foundation

extension Array {
    subscript(safe i: Self.Index) -> Element? {
        if startIndex <= i && i <= endIndex - 1 {
            return self[i]
        } else {
            return nil
        }
    }
}
