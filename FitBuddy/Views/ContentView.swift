//
//  ContentView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WorkoutView()
                .tabItem {
                    Label("Workouts", systemImage: "flame.fill")
                }

            FoodTrackerView()
                .tabItem {
                    Label("Food", systemImage: "leaf.fill")
                }

            SocialFeedView()
                .tabItem {
                    Label("Social", systemImage: "person.2.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
