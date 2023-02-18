//
//  DateFormattingExtension.swift
//  GitPeek
//
//  Created by Ashish Badak on 18/02/23.
//

import Foundation

extension Date {
    var relativeTime: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
