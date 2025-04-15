//
//  SignUpView.swift
//  FitBuddy
//
//  Created by Yailan Bordas on 4/1/25.
//

import SwiftUI

struct SignUpView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = false

    @State private var username = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var isSignedUp = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Create an Account")
                .font(.title)

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }

            Button("Sign Up") {
                signUp()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    private func signUp() {
        let user = User(username: username, password: password)
        user.signup { result in
            switch result {
            case .success(let user):
                print("✅ Signed up as \(user.username ?? "")")
                isLoggedIn = true
            case .failure(_):
                errorMessage = "Sign up failed. Please try again."
                username = ""
                password = ""
            }
        }
    }
}

