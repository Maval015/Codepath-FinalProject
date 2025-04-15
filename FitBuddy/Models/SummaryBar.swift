//
//  SummaryBar.swift
//  FitBuddy
//
//  Created by michel avalos on 4/1/25.
//

import SwiftUI

struct SummaryBar: View {
    let title: String
    let value: Int
    let goal: Int
    let color: Color

    private var progress: Double {
        min(Double(value) / Double(goal), 1.0)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                Spacer()
                Text("\(value) / \(goal)")
                    .foregroundColor(.gray)
            }
            .font(.subheadline)
            .padding(.horizontal)

            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: color))
                .frame(height: 6)
                .padding(.horizontal)
        }
        .padding(.vertical, 4)
    }
}

