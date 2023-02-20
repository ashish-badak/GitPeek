//
//  PullRequestViewModel.swift
//  GitPeek
//
//  Created by Ashish Badak on 18/02/23.
//

import Foundation

final class PullRequestViewModel {
    let title: String
    let creationTime: String?
    let closureTime: String?
    let userViewModel: UserViewModel
    
    init(pullRequest: PullRequest) {
        userViewModel = UserViewModel(user: pullRequest.user)
        title = pullRequest.title
        
        if let relativeTime = pullRequest.createdAt?.relativeTime {
            creationTime = "Created \(relativeTime)"
        } else {
            creationTime = nil
        }
        
        if let relativeTime = pullRequest.mergedAt?.relativeTime {
            closureTime = "Merged \(relativeTime)"
        } else if let relativeTime = pullRequest.closedAt?.relativeTime {
            closureTime = "Closed \(relativeTime)"
        } else {
            closureTime = nil
        }
    }
}
