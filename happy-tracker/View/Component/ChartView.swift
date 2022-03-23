//
//  ChartView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/21/22.
//

import SwiftUI
import SwiftUICharts



struct ChartView: View {
    
    var body: some View {
        
        VStack {
            
                
            // Main Line chart
         
            LineView(data: [0,30,40,50,45,20,90,100],
                     title: "Emotion tracker",
                     legend: "Happy")
        } .padding(.horizontal, 20)
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
