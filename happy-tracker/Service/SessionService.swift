//
//  SessionService.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/28/22.
//

import Firebase
import FirebaseFirestore

struct SessionService {
    
    static func uploadSession(session: RecordModel) {
        let sessionDocumentRef: DocumentReference?
        
        sessionDocumentRef = try? Firestore.firestore().collection("session").addDocument(from: session)
        if let sessionDocumentRef = sessionDocumentRef {
            print("SESSION SERVICE - successfully uploaded document: \(sessionDocumentRef.documentID)")
        } else {
            print("Error handling session entry")
        }
    }
    
    static func getSessions(forUserID userID: String) {
        
            Firestore.firestore().collection("session").whereField("uid", isEqualTo: userID)
            .getDocuments { snapshot, err in
                if let err = err {
                    print("Error getting sessions: \(err)")
                } else {
                    for document in snapshot!.documents {
                        print("Document id: \(document.documentID)")
                    }
                }
            }
            
            
            /*
            db.collection("cities").whereField("capital", isEqualTo: true)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                        }
                    }
            }
            */
    }
}
