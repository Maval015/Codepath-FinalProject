//
//  SocialViewModel.swift
//  FitBuddy
//
//  Created by michel avalos on 4/15/25.
//

import SwiftUI

class SocialViewModel: ObservableObject {
    @Published var posts: [SocialPost] = []

    func shareWorkout(photo: UIImage?, calories: Int, time: Int, steps: Int, notes: String) {
        let post = SocialPost(
            type: .workout,
            photo: photo,
            title: "Workout Logged",
            subtitle: "🔥 \(calories) kcal • ⏱ \(time) min • 👣 \(steps) steps",
            notes: notes,
            timestamp: Date()
        )
        posts.append(post)
    }

    func shareMeal(entry: FoodEntry) {
        let post = SocialPost(
            type: .meal,
            photo: entry.photo,
            title: "Meal Logged",
            subtitle: "🔥 \(entry.calories) kcal • 🥩 \(entry.protein)g • 🍞 \(entry.carbs)g",
            notes: entry.notes,
            timestamp: entry.timestamp
        )
        posts.append(post)
    }
}
