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
        
        if let sessionDict = session.toDict(){
            sessionDocumentRef = Firestore.firestore().collection("session").addDocument(data: sessionDict)
            print("successfully uploaded document: \(sessionDocumentRef!.documentID)")
        } else {
            print("Error handling session entry")
        }
    }
}





