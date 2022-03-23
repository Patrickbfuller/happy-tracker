//
//  ChartPageView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/22/22.
//

import SwiftUI



struct ChartPageView: View {
    
    var body: some View {
        
        VStack(spacing: 20){
            Text("Home")
            
            
            //Line chart
            
            // Image(systemName: "chart.xyaxis.line")
            
            ChartView()
            
                .frame(width: 390, height: 350)
                .scaledToFit()
                .padding()
            
            
            Spacer()
            
            //mini list view
            Rectangle()
                .frame(width: 400, height: 200)
                .cornerRadius(20)
                .padding()
                .foregroundColor(.blue)
            
            
            Spacer()
            Divider()
            HStack(spacing: 20){
                //Button "Chart"
                CustomButton(buttonLabel: "Chart") {
                    // button action
                }
                .padding()
                
                
                Divider()
                
                
                //Button "List"
                CustomButton(buttonLabel: "List") {
                    // button action
                }
                .padding()
            }
            
            
        }
        .background(Color("pale").opacity(0.2))
    }
}



struct ChartPageView_Previews: PreviewProvider {
    static var previews: some View {
        ChartPageView()
    }
}
