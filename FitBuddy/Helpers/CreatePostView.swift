//
//  CreatePostView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/15/25.
//


import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: SocialViewModel

    @State private var postType: SocialPostType = .meal
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var time = ""
    @State private var steps = ""
    @State private var notes = ""
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var postImage: UIImage?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Post Type")) {
                    Picker("Type", selection: $postType) {
                        Text("Meal").tag(SocialPostType.meal)
                        Text("Workout").tag(SocialPostType.workout)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Details")) {
                    TextField("Calories", text: $calories)
                        .keyboardType(.numberPad)

                    if postType == .meal {
                        TextField("Protein (g)", text: $protein)
                            .keyboardType(.numberPad)
                        TextField("Carbs (g)", text: $carbs)
                            .keyboardType(.numberPad)
                    }

                    if postType == .workout {
                        TextField("Time Exercised (min)", text: $time)
                            .keyboardType(.numberPad)
                        TextField("Steps Taken", text: $steps)
                            .keyboardType(.numberPad)
                    }
                }

                Section(header: Text("Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 100)
                }

                Section(header: Text("Photo")) {
                    if let image = postImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                    }

                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        Label("Select an Image", systemImage: "photo")
                    }
                }

                Section {
                    Button("Post to Feed") {
                        submitPost()
                    }
                    .disabled(!formIsValid)
                }
            }
            .navigationTitle("Create Post")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .onChange(of: selectedPhoto) { newItem in
                Task {
                    guard let item = newItem else { return }
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        postImage = image
                    }
                }
            }

        }
    }

    private var formIsValid: Bool {
        guard Int(calories) != nil else { return false }
        if postType == .meal {
            return Int(protein) != nil && Int(carbs) != nil
        } else {
            return Int(time) != nil && Int(steps) != nil
        }
    }

    private func submitPost() {
        let cal = Int(calories) ?? 0
        let note = notes.trimmingCharacters(in: .whitespacesAndNewlines)

        if postType == .meal {
            let pro = Int(protein) ?? 0
            let carb = Int(carbs) ?? 0

            let subtitle = "🔥 \(cal) kcal • 🥩 \(pro)g • 🍞 \(carb)g"

            let username = User.current?.username ?? "Anonymous"

            let post = SocialPost(
                type: .meal,
                photo: postImage,
                title: "Shared a Meal",
                subtitle: subtitle,
                notes: note,
                timestamp: Date(),
                username: username
            )
            viewModel.posts.append(post)
            
        } else {
            let mins = Int(time) ?? 0
            let stp = Int(steps) ?? 0

            let subtitle = "🔥 \(cal) kcal • ⏱ \(mins) min • 👣 \(stp) steps"

            let username = User.current?.username ?? "Anonymous"

            let post = SocialPost(
                type: .workout,
                photo: postImage,
                title: "Completed a Workout",
                subtitle: subtitle,
                notes: note,
                timestamp: Date(),
                username: username
            )
            viewModel.posts.append(post)
        }

        dismiss()
    }
}

