//
//  WorkoutView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/1/25.
//


import SwiftUI

struct WorkoutView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = true
    @StateObject private var viewModel = WorkoutViewModel()
    @State private var showingLogSheet = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 30) {
                        // Progress Bars
                        ProgressBar(title: "Calories Burned", value: viewModel.totalCalories, goal: viewModel.calorieGoal, color: .red)
                        ProgressBar(title: "Time Exercised (min)", value: viewModel.totalTime, goal: viewModel.timeGoal, color: .green)
                        ProgressBar(title: "Steps Taken", value: viewModel.totalSteps, goal: viewModel.stepGoal, color: .blue)

                        Divider()

                        // Workout History Header
                        Text("Workout History")
                            .font(.headline)
                            .padding(.top)

                        if viewModel.workouts.isEmpty {
                            Text("No workouts logged yet.")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            ForEach(viewModel.workouts.reversed()) { workout in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("🏋️ \(workout.type)")
                                        .font(.headline)

                                    Text("🔥 \(workout.calories) kcal")
                                    Text("⏱ \(workout.timeMinutes) minutes")
                                    Text("👣 \(workout.steps) steps")
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top)
                }

                // Log Workout Button (Positioned safely above tab bar)
                Button("Log Workout") {
                    showingLogSheet = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            .navigationTitle("Workout Summary")
            .sheet(isPresented: $showingLogSheet) {
                LogWorkoutView(viewModel: viewModel)
            }
            .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Log Out") {
                                    User.logout { _ in
                                        isLoggedIn = false
                                    }
                                }
                            }
                        }
        }
    }
}


