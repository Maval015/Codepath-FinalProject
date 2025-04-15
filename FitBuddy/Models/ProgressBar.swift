//
//  ProgressBar.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//


import SwiftUI

struct ProgressBar: View {
    let title: String
    let value: Int
    let goal: Int
    let color: Color

    var progress: Double {
        min(Double(value) / Double(goal), 1.0)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .padding(.leading)

            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: color))
                .frame(height: 10)
                .padding(.horizontal)

            Text("\(value) / \(goal)")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.leading)
        }
    }
}

