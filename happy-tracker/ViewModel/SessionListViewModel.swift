//
//  SessionListViewModel.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 4/1/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class SessionListViewModel: ObservableObject {
    
    var sessions: [RecordModel] = []
    
    init() {
        addSnapshotListener()
        print("session view model init-ing")
    }
    
    
    func addSnapshotListener() {
        Firestore.firestore().collection("session")
            .addSnapshotListener { snapshot, err in
                if let err = err {
                    print("Error getting sessions: \(err)")
                } else {
                    for document in snapshot!.documents {
//                        print("Document id: \(document.documentID)")
                    }
                }
            }
    }
}
