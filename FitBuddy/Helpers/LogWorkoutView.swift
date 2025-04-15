//
//  LogWorkoutView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//


import SwiftUI

struct LogWorkoutView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: WorkoutViewModel

    @State private var type: String = ""
    @State private var calories: String = ""
    @State private var time: String = ""
    @State private var steps: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Workout Details")) {
                    TextField("Workout Type (e.g. Running, Yoga)", text: $type)

                    TextField("Calories Burned", text: $calories)
                        .keyboardType(.numberPad)

                    TextField("Time Exercised (minutes)", text: $time)
                        .keyboardType(.numberPad)

                    TextField("Steps Taken", text: $steps)
                        .keyboardType(.numberPad)
                }

                Section {
                    Button("Save Workout") {
                        saveWorkout()
                    }
                    .disabled(type.isEmpty || calories.isEmpty || time.isEmpty || steps.isEmpty)
                }
            }
            .navigationTitle("Log Workout")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func saveWorkout() {
        guard let calorieInt = Int(calories.trimmingCharacters(in: .whitespaces)),
              let timeInt = Int(time.trimmingCharacters(in: .whitespaces)),
              let stepInt = Int(steps.trimmingCharacters(in: .whitespaces)),
              !type.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("❌ Invalid input detected")
            return
        }

        viewModel.logWorkout(type: type, calories: calorieInt, time: timeInt, steps: stepInt)
        print("✅ Logged workout: \(type) \(calorieInt) kcal, \(timeInt) min, \(stepInt) steps")
        dismiss()
    }

}

