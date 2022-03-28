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

    @StateObject var viewModel = AuthViewModel()
    
    init() {

        FirebaseApp.configure()
        
    }

    var body: some Scene {
        WindowGroup {
            NavigationView{
             ContentView()
                    //.environmentObject(viewModel)
            }
            .environmentObject(viewModel)
        }
    }
}

