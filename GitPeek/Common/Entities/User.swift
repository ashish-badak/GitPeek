//
//  User.swift
//  GitPeek
//
//  Created by Ashish Badak on 16/02/23.
//

import Foundation

struct User: Decodable {
    let id: Int
    let username: String
    let avatarURL: URL?

    enum CodingKeys: String, CodingKey {
        case id
        case username = "login"
        case avatarURL = "avatar_url"
    }
}
