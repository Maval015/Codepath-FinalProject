//
//  SignInView.swift
//  FitBuddy
//
//  Created by Yailan Bordas on 4/14/25.
//

import SwiftUI

struct SignInView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = false

    @State private var username = ""
    @State private var password = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 20) {
            Text("FitBuddy")
                .font(.largeTitle)
                .bold()

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center) // center the message
                    .frame(maxWidth: .infinity, alignment: .center)
            }

            Button("Sign In") {
                login()
            }
            .buttonStyle(.borderedProminent)

            NavigationLink("Don't have an account? Sign Up", destination: SignUpView())
        }
        .padding()
    }

    private func login() {
        User.login(username: username, password: password) { result in
            switch result {
            case .success(let user):
                print("✅ Logged in as \(user.username ?? "")")
                isLoggedIn = true
            case .failure(_):
                errorMessage = "Incorrect Sign In. Please check your username and password."
                username = ""
                password = ""
            }
        }
    }
}

