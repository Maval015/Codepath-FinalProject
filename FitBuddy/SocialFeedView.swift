//
//  SocialFeedView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//



import SwiftUI

struct SocialFeedView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Friend Activity")
                    .font(.title)
                    .padding()

                List {
                    Text("🏋️ John just finished a 5km run!")
                    Text("🍎 Lisa logged a healthy breakfast.")
                }

                Spacer()
            }
            .navigationTitle("Social")
        }
    }
}
