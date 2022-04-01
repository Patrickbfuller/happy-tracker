//
//  MiniListView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/24/22.
//

import SwiftUI

struct MiniListView: View {
    
    var miniListRow: MiniListRow
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            ScrollView(showsIndicators: true) {
                VStack {
                    Text("Your Checkups")
                        .padding()
                        .font(.headline)
                    ForEach(0 ... 10, id: \.self) { list in
                        MiniListRow()
                        
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
        MiniListView(miniListRow: MiniListRow())
    }
}
