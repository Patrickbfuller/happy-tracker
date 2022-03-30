//
//  UserModel.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/29/22.
//


import FirebaseFirestoreSwift
import FirebaseFirestore

struct UserModel:Codable {
    let email: String
    let name: String
    let userID: String
}

