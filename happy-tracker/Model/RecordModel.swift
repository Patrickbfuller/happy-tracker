//
//  RecordModel.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/28/22.
//


import FirebaseFirestoreSwift
import FirebaseFirestore



struct RecordModel: Identifiable {
    @DocumentID var id: String?
    
    let uid: String //author of the seesion
    let caption: String
    let userID: String
    let timestamp: Timestamp
    var happyConf: Double
    var sadConf: Double
    let comment: String
    
   
}

