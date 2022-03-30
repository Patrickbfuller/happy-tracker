//
//  UserModel.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/29/22.
//


import FirebaseFirestoreSwift
import FirebaseFirestore

<<<<<<< HEAD
struct UserModel: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let name: String
    //let userID: String
   
=======
struct UserModel:Codable {
    let email: String
    let name: String
    let userID: String
>>>>>>> main
}

