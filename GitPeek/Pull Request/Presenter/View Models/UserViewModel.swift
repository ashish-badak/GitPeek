//
//  UserViewModel.swift
//  GitPeek
//
//  Created by Ashish Badak on 18/02/23.
//

import Foundation

final class UserViewModel {
    let username: String
    private let originalAvatarURL: URL?
    private var avatarURL: URL?
    
    init(user: User) {
        self.username = user.login
        self.originalAvatarURL = user.avatarUrl
    }
    
    func avatarURL(sizedTo size: CGFloat) -> URL? {
        if let url = avatarURL { return url }
        avatarURL = originalAvatarURL?.resized(withSize: size)
        return avatarURL
    }
}
