//
//  UserService.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/30/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completeSettingUser: @escaping(UserModel?, Error?)->Void){
        
        var fetchError: Error?
        var user: UserModel?
        
        Firestore.firestore().collection("users").document(uid).getDocument{snapshot, _ in
            
            if let snapshot = snapshot  {
                //            guard let user = try? snapshot.data(as: UserModel.self) else {return}
                //            let user = try? snapshot.data(as: UserModel.self)
                do {
                    user = try snapshot.data(as: UserModel.self)
                } catch {
                    fetchError = error
                }
                
                if let user = user {
                    print("Users name is : \(user.name)")
                    print("Users email is : \(user.email)")
                    print("DEBUG: Users uid is: \(user.id)")
                }
            } else {
                fetchError = UserServiceError.snapshotError
            }
            completeSettingUser(user, fetchError)
        }
    }
}

enum UserServiceError: Error {
    case snapshotError
}
