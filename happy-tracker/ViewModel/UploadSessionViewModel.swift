//
//  UploadSessionViewModel.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/28/22.
//

import Foundation


class UploadSessionViewModel: ObservableObject {
    
    let service = SessionService()
    
    func uploadSession(withCaption caption: String) {
        service.uploadSession(caption: caption)
        
        
    }
}




