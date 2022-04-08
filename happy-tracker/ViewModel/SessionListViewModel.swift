//
//  SessionListViewModel.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 4/1/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class SessionListViewModel: ObservableObject {
    
    @Published var sessions: [RecordModel] = []
//    @State var toggleIsOn: Bool
    
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
            .order(by: "timestamp", descending: true)
            //.order(by: "timestamp", descending: toggleIsOn ? true : false)
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
    
//    func toggle(){
//        Toggle(isOn: $toggleIsOn,
//                           label: {
//                        Text(toggleIsOn ? "Recent" : "Oldest")
//                    })
//    }
    
    
}
