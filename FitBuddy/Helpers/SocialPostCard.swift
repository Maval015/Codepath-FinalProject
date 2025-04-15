//
//  SocialPostCard.swift
//  FitBuddy
//
//  Created by michel avalos on 4/2/25.
//

import SwiftUI

struct SocialPostCard: View {
    let post: SocialPost

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Optional photo
            if let image = post.photo {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(12)
            }

            // Title
            Text(post.title)
                .font(.headline)

            // Subtitle
            Text(post.subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)

            // Notes
            if !post.notes.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                Text("📝 \(post.notes)")
                    .font(.body)
            }
            
            // Username
            Text("👤 \(post.username)")
                .font(.caption)
                .foregroundColor(.blue)

            // Timestamp — naturally flows after content
            Text(post.timestamp.formatted(date: .abbreviated, time: .shortened))
                .font(.caption2)
                .foregroundColor(.gray)
                .padding(.top, 4)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
    }
}

