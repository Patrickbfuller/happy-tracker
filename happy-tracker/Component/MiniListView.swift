//
//  MiniListView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/24/22.
//

import SwiftUI
import Firebase

struct MiniListView: View {
    
    var sessions: [RecordModel]
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            VStack(spacing: 0) {
                Text("Your Checkups")
                    .padding()
                    .font(.headline)
                ScrollView(showsIndicators: true) {
                    VStack(spacing: 4) {
                        ForEach(Array(zip(sessions.indices, sessions)), id: \.0)
                        {index, listedSession in
                            
                            MiniListRow(
                                session: listedSession,
                                backgroundOpacity: index % 2 == 0 ? 0.1 : 0.3)
                        }
                    }
                }
                
            }
            
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                )
                .opacity(0.5)
                .ignoresSafeArea()
                .frame(height: 50)
        }
        
    }
    
}


struct MiniListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let sessions = [
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 8.0, sadConf: 0.0, comment: "This is a really long com ment without intentional line breaks"),
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 0.0, sadConf: 0.0, comment: "This is a shorter comment"),
            RecordModel(id: "id", userID: "uid", timestamp: Timestamp(date: Date()), happyConf: 6.0, sadConf: 0.0, comment: "This is a really long comment without intentional line breaks")]
        MiniListView(sessions: sessions)
            
        //            .preferredColorScheme(.dark)
    }
}
