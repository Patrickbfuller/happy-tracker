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
    
    func fetchUser(withUid uid: String){
        //print("FETCH user with id")
        Firestore.firestore().collection("users").document(uid).getDocument{snapshot, _ in
            guard let snapshot = snapshot else {return}
            //print("SNAPSHOT HERE: \(snapshot.data())")
            guard let user = try? snapshot.data(as: UserModel.self) else {return}
            print("Users name is : \(user.name)")
            print("Users email is : \(user.email)")
        }
    }
}
