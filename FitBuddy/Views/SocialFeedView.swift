//
//  SocialFeedView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//



import SwiftUI

struct SocialFeedView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = true
    @StateObject private var viewModel = SocialViewModel()
    @State private var showingCreatePost = false  // ✅ Declare this

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(spacing: 20) {
                        if viewModel.posts.isEmpty {
                            Text("No shared posts yet.")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            ForEach(viewModel.posts.sorted(by: { $0.timestamp > $1.timestamp })) { post in
                                SocialPostCard(post: post)
                            }
                        }
                    }
                    .padding()
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

                // ✅ Floating "New Post" Button
                Button(action: {
                    showingCreatePost = true
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 20)
                .accessibilityLabel("Create New Post")
            }
            .navigationTitle("Social Feed")
        }
        .sheet(isPresented: $showingCreatePost) {
            CreatePostView(viewModel: viewModel)
        }
        
    }
}


