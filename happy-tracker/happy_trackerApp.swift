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
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    init() {

        FirebaseApp.configure()
        
    }

    var body: some Scene {
        WindowGroup {
            NavigationView{
             ContentView()
                    //.environmentObject(viewModel)
            }
            .navigationViewStyle(.stack)
            .environmentObject(viewModel)
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationViewStyle(.stack)
        }
        
    }
}
