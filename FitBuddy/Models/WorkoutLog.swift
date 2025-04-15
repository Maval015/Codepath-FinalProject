//
//  WorkoutLog.swift
//  FitBuddy
//
//  Created by Yailan Bordas on 4/1/25.
//

import Foundation
import ParseSwift

struct WorkoutLog: ParseObject {
    // MARK: - Required ParseObject properties
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // MARK: - Your custom fields
    var user: User?
    var type: String?
    var calories: Int?
    var timeMinutes: Int?
    var steps: Int?
    
    // MARK: - Required className
    static var className: String {
        "WorkoutLog"
    }
    
    // MARK: - Initializers
    init() {}
    
    init(workout: Workout, user: User) {
        self.user = user
        self.type = workout.type
        self.calories = workout.calories
        
    }
}
