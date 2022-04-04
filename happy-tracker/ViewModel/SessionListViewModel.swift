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
        if let userID = Auth.auth().currentUser?.uid {
            addSnapshotListener(userID: userID)
        } else {
            print("ERROR LOGGING: could not access current user id for fetching sessions.")
        }
    }
    
    func addSnapshotListener(userID: String) {
        Firestore.firestore()
            .collection("session")
            .whereField("userID", isEqualTo: userID)
            .addSnapshotListener { snapshot, err in
                if let err = err {
                    print("Error getting sessions: \(err)")
                } else {
                    self.sessions = snapshot!.documents
                        .compactMap({ docSnapshot -> RecordModel? in
                            var session: RecordModel? = nil
                            do {
                                session = try docSnapshot.data(as: RecordModel.self)
                            } catch {
                                print("LOGGING Error retreiving session w document id, \(docSnapshot.documentID), error: \(error.localizedDescription)")
                            }
                            return session
                        })
                }
            }
    }
}
