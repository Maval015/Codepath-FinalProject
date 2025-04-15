//
//  User.swift
//  FitBuddy
//
//  Created by Yailan Bordas on 4/14/25.
//

import Foundation
import ParseSwift

struct User: ParseUser {
    var originalData: Data?
    
    var createdAt: Date?
    
    var updatedAt: Date?
    
    var ACL: ParseSwift.ParseACL?
    
    // Required by Parse
    var objectId: String?
    var username: String?
    var email: String?
    var password: String?
    var emailVerified: Bool?
    var authData: [String: [String: String]?]?

    // Custom user fields (optional)
    var firstName: String?
    var lastName: String?

    // Default initializer
    init() {}
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
