//
//  FoodViewModel.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//


import SwiftUI

class FoodViewModel: ObservableObject {
    @Published var foodEntries: [FoodEntry] = []

    // Daily Goals (hardcoded for now)
    let calorieGoal = 2000
    let proteinGoal = 150
    let carbGoal = 250

    // Daily Totals
    var totalCalories: Int {
        foodEntries.reduce(0) { $0 + $1.calories }
    }

    var totalProtein: Int {
        foodEntries.reduce(0) { $0 + $1.protein }
    }

    var totalCarbs: Int {
        foodEntries.reduce(0) { $0 + $1.carbs }
    }

    func logFood(_ entry: FoodEntry) {
        foodEntries.append(entry)
    }

    func calorieProgress() -> Double {
        min(Double(totalCalories) / Double(calorieGoal), 1.0)
    }

    func proteinProgress() -> Double {
        min(Double(totalProtein) / Double(proteinGoal), 1.0)
    }

    func carbProgress() -> Double {
        min(Double(totalCarbs) / Double(carbGoal), 1.0)
    }
}
