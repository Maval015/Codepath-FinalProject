//
//  WorkoutView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//


import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Calories Burned Today")
                    .font(.title)
                    .padding(.top)

                Text("🔥 0 kcal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                Spacer()

                Button(action: {
                    // Add workout logic here
                }) {
                    Text("Log Workout")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .navigationTitle("Workout Summary")
        }
    }
}

