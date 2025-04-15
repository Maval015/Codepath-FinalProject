//
//  FitBuddyApp.swift
//  FitBuddy
//
//  Created by Yailan Bordas on 4/1/25.
//

import SwiftUI
import ParseSwift

@main
struct FitBuddyApp: App {

    init() {
        ParseSwift.initialize(applicationId: "lDAvIslgTlMisYTj09nUGCSggDpmwtmGtgIriv2C",
                              clientKey: "pYsiCNS1KvrpFxZmIxr17fsRlR9ibiUmxTvzQbGd",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
