//
//  LogFoodView.swift
//  FitBuddy
//
//  Created by michel avalos on 4/14/25.
//


import SwiftUI
import PhotosUI

struct LogFoodView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: FoodViewModel

    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var notes = ""
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var foodImage: UIImage?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Macros")) {
                    TextField("Calories", text: $calories)
                        .keyboardType(.numberPad)

                    TextField("Protein (g)", text: $protein)
                        .keyboardType(.numberPad)

                    TextField("Carbs (g)", text: $carbs)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Notes")) {
                    TextEditor(text: $notes)
                        .frame(minHeight: 100)
                }

                Section(header: Text("Add a Photo")) {
                    if let image = foodImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                    }

                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        Label("Select Food Image", systemImage: "photo")
                    }
                }

                Section {
                    Button("Save Entry") {
                        saveFood()
                    }
                    .disabled(!isFormValid)
                }
            }
            .navigationTitle("Log Food")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .onChange(of: selectedPhoto) { item in
                guard let item else { return }

                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        foodImage = uiImage
                    }
                }
            }
        }
    }

    private var isFormValid: Bool {
        Int(calories) != nil && Int(protein) != nil && Int(carbs) != nil
    }

    private func saveFood() {
        guard let cal = Int(calories),
              let pro = Int(protein),
              let carb = Int(carbs) else { return }

        let entry = FoodEntry(
            photo: foodImage,
            calories: cal,
            protein: pro,
            carbs: carb,
            notes: notes.trimmingCharacters(in: .whitespacesAndNewlines),
            timestamp: Date()
        )

        viewModel.logFood(entry)
        dismiss()
    }
}
