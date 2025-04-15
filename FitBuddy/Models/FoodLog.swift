//
//  FoodLog.swift
//  FitBuddy
//
//  Created by Yailan Bordas on 4/1/25.
//

import Foundation
import ParseSwift

struct FoodLog: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    var user: User?
    var calories: Int?
    var protein: Int?
    var carbs: Int?
    var notes: String?
    var timestamp: Date?
    
    static var className: String {
            "FoodLog"
        }

    init() {}

    init(entry: FoodEntry, user: User) {
        self.user = user
        self.calories = entry.calories
        self.protein = entry.protein
        self.carbs = entry.carbs
        self.notes = entry.notes
        self.timestamp = entry.timestamp
    }
}
