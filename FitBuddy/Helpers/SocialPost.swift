//
//  SocialPost.swift
//  FitBuddy
//
//  Created by michel avalos on 4/15/25.
//

import SwiftUI

enum SocialPostType: String, CaseIterable, Identifiable {
    case meal
    case workout

    var id: String { rawValue }
}

struct SocialPost: Identifiable {
    let id = UUID()
    let type: SocialPostType
    let photo: UIImage?
    let title: String
    let subtitle: String
    let notes: String
    let timestamp: Date
    let username: String
}
