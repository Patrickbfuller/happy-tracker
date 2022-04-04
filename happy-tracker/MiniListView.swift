//
//  MiniListView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/24/22.
//

import SwiftUI

struct MiniListView: View {
    
    var sessions: [RecordModel]
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            VStack(spacing: 0) {
                Text("Your Checkups")
                    .padding()
                    .font(.headline)
                ScrollView(showsIndicators: true) {
                    
                    ForEach(Array(zip(sessions.indices, sessions)), id: \.0) {index, listedSession in
                        
                        MiniListRow(
                            session: listedSession,
                            backgroundOpacity: index % 2 == 0 ? 0.1 : 0.3)
                        
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
        MiniListView(sessions: [])
    }
}
