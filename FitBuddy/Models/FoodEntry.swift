//
//  FoodEntry.swift
//  FitBuddy
//
//  Created by michel avalos on 4/1/25.
//


import SwiftUI

struct FoodEntry: Identifiable {
    let id = UUID()
    let photo: UIImage?
    let calories: Int
    let protein: Int
    let carbs: Int
    let notes: String
    let timestamp: Date
}

