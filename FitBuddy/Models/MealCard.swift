//
//  MealCard.swift
//  FitBuddy
//
//  Created by michel avalos on 4/1/25.
//


import SwiftUI

struct MealCard: View {
    let entry: FoodEntry

    var body: some View {
        VStack(alignment: .leading) {
            if let image = entry.photo {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 180)
                    .clipped()
                    .cornerRadius(10)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 180)
                    .overlay(Text("No Image").foregroundColor(.gray))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("🔥 \(entry.calories) kcal | 🥩 \(entry.protein)g | 🍞 \(entry.carbs)g")
                    .font(.subheadline)
                    .fontWeight(.medium)

                if !entry.notes.isEmpty {
                    Text("📝 \(entry.notes)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }

                Text(entry.timestamp.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(.top, 4)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}
