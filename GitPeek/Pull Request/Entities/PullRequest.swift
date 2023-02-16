//
//  PullRequest.swift
//  GitPeek
//
//  Created by Ashish Badak on 16/02/23.
//

import Foundation

struct PullRequest: Decodable {
    let id: Int
    let title: String
    let user: User
    let state: State
    let number: Int
    let createdAt: Date?
    let mergedAt: Date?
    let closedAt: Date?
    
    enum State: String, Decodable {
        case open
        case merged
        case closed
    }
}
