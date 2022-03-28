//
//  UserLandingView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/21/22.
//
import SwiftUI

struct UserLandingView: View {
    var body: some View {
        VStack{
            //Chart
            //Text("Chart Goes here")
            MiniChartView()
                .padding(.top)
            
            //Text("Session list goes here")
            //List of Dates and Happy/Sad Labels
            MiniListView(miniListRow: MiniListRow())
            
            CustomButton(buttonLabel: "Record Session") {
                // button action
            }
            
        }
        
        
    }
        
}

struct UserLandingView_Previews: PreviewProvider {
    static var previews: some View {
        UserLandingView()
    }
}
