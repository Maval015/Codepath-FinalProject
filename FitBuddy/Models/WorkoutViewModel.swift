//
//  WorkoutViewModel.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//


import SwiftUI

struct Workout: Identifiable {
    let id = UUID()
    let type: String
    let calories: Int
    let timeMinutes: Int
    let steps: Int
}

class WorkoutViewModel: ObservableObject {
    @Published var workouts: [Workout] = []

    let calorieGoal = 700
    let timeGoal = 60
    let stepGoal = 10000

    var totalCalories: Int {
        workouts.reduce(0) { $0 + $1.calories }
    }

    var totalTime: Int {
        workouts.reduce(0) { $0 + $1.timeMinutes }
    }

    var totalSteps: Int {
        workouts.reduce(0) { $0 + $1.steps }
    }

    var calorieProgress: Double {
        min(Double(totalCalories) / Double(calorieGoal), 1.0)
    }

    var timeProgress: Double {
        min(Double(totalTime) / Double(timeGoal), 1.0)
    }

    var stepProgress: Double {
        min(Double(totalSteps) / Double(stepGoal), 1.0)
    }

    func logWorkout(type: String, calories: Int, time: Int, steps: Int) {
        let newWorkout = Workout(type: type, calories: calories, timeMinutes: time, steps: steps)
        workouts.append(newWorkout)
    }
}


