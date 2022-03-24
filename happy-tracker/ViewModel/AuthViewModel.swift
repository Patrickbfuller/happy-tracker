//
//  AuthViewModel.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/24/22.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
   
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, link: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
        }
            guard let user = result?.user else { return }
            self.userSession = user
    }
    }
    
    func register(withEmail email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
      
            guard let user = result?.user else { return }
            self.userSession = user
            
        }
    }

   

    
}
