//
//  happy_trackerApp.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/21/22.
//

import SwiftUI
import Firebase

@main
struct happy_trackerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
          //  ContentView()
            LoginView()
        }
    }
}
