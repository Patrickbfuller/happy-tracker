//
//  SessionService.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/28/22.
//

import Firebase
import FirebaseFirestore

struct SessionService {
    
    func uploadSession(caption: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "timestamo": Timestamp(date: Date()),
                    "happyConf": 0.00,
                    "sadConf": 0.00,
                    "comment": "Tell us more about you"] as [String : Any]
        
        Firestore.firestore().collection("sessions").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload session with error: \(error.localizedDescription)")
                    
                    return
                }
            }
    }
}



