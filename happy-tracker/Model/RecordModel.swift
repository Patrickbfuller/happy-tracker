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
    
 //   let uid: String
    let user: String
    let timestamp: Timestamp
    let happyConf: Double
    let sadConf: Double
    let comment: String
    
   
}

