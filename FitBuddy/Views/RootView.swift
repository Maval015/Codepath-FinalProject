//
//  RootView.swift
//  FitBuddy
//
//  Created by Yailan Bordas on 4/1/25.
//

import SwiftUI
import ParseSwift

struct RootView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = User.current != nil

    var body: some View {
        NavigationView {
            if isLoggedIn {
                ContentView()
            } else {
                SignInView()
            }
        }
    }
}

