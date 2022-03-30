//
//  AuthViewModel.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/24/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    var authError: Error?
    
    @Published var isError: Bool = false
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to Sign in with error \(error.localizedDescription)")
                
                self.setError(error)
                
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, confirmedPassword: String, name: String) {
        
        // Assert name not empty
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        guard trimmedName != "" else {
            setError(AuthError.emptyName)
            return
        }
        
        // Assert passwords match
        guard password == confirmedPassword else {
            setError(AuthError.passwordConfirmFailure)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                
                self.setError(error)
                
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            //set up data dictionary to store user in database
            let data = ["email": email,
                        "name": trimmedName,
                        "uid": user.uid]
            
//            let userModel = UserModel(email: email, name: trimmedName, userID: user.uid)
//
//            let data = try? JSONEncoder().encode(userModel)
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: did upload user data")
                }
            
        }
    }
    
    func setError(_ error: Error) {
        self.authError = error
        self.isError = true
    }
    
    func signOut() {
        //logs out on frontend, send us back to login
        userSession = nil
        //logs out on backend
        try? Auth.auth().signOut()
    }
}

enum AuthError: Error {
    
    case emptyName
    case passwordConfirmFailure
        
}

extension AuthError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .emptyName:

            return NSLocalizedString(
                            "The name cannot be empty.",
                            comment: "Invalid Name"
                        )

        case .passwordConfirmFailure:
            return NSLocalizedString(
                            "Your passwords must match.",
                            comment: "Passwords Match Error"
                        )
        }
    }
}
