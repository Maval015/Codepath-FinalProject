//
//  FoodTrackerView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/1/25.
//


import SwiftUI

struct FoodTrackerView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = true
    @StateObject private var viewModel = FoodViewModel()
    @State private var showingLogSheet = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // 🥗 Section 1: Meal Cards
                Text("Your Meals")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)

                if viewModel.foodEntries.isEmpty {
                    Text("No meals logged yet.")
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(viewModel.foodEntries.reversed()) { entry in
                                MealCard(entry: entry)
                                    .frame(width: 280)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 340)
                }

                // 📊 Section 2: Daily Summary — placed right after cards
                if !viewModel.foodEntries.isEmpty {
                    Text("Daily Summary")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.top)

                    SummaryBar(title: "Calories", value: viewModel.totalCalories, goal: viewModel.calorieGoal, color: .red)
                    SummaryBar(title: "Protein", value: viewModel.totalProtein, goal: viewModel.proteinGoal, color: .green)
                    SummaryBar(title: "Carbs", value: viewModel.totalCarbs, goal: viewModel.carbGoal, color: .orange)
                }

                Spacer()

                // ➕ Section 3: Button to Log Food
                Button("Log Food") {
                    showingLogSheet = true
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            .padding(.top)
            .navigationTitle("Food Tracker")
            .sheet(isPresented: $showingLogSheet) {
                LogFoodView(viewModel: viewModel)
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


