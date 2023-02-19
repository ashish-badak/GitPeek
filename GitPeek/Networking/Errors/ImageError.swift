//
//  ImageError.swift
//  GitPeek
//
//  Created by Ashish Badak on 20/02/23.
//

import Foundation

enum ImageError: Error {
    case noData
    case corruptImage
    case fetchError
}
