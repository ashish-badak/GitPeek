//
//  User.swift
//  GitPeek
//
//  Created by Ashish Badak on 16/02/23.
//

import Foundation

struct User: Decodable {
    let id: Int
    let login: String
    let avatarUrl: URL?
}
