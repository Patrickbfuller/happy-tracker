//
//  ChartPageView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/22/22.
//

import SwiftUI


struct ChartPageView: View {
    
    var body: some View {



        VStack{
            Text("Emotion Tracker")
             
                .font(.title2)
                .fontWeight(.bold)
        
            ChartView()
             //  .padding(.bottom)
            
            //Spacer()
             //  Divider()
            
//            MiniListView(miniListRow: MiniListRow())
             //   .padding(.top,20)
            
        
        }
        .background(Color("pale").opacity(0.2))
    }
}



struct ChartPageView_Previews: PreviewProvider {
    static var previews: some View {
        ChartPageView()
    }
}
