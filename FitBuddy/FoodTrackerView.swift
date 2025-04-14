//
//  FoodTrackerView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//


import SwiftUI

struct FoodTrackerView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Food Intake")
                    .font(.title)
                    .padding()

                Text("🍽️ 0 kcal")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()

                Button("Add Food Entry") {
                    // Navigate or present modal to add food
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()
            }
            .navigationTitle("Food Tracker")
        }
    }
}

