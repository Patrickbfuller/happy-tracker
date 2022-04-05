//
//  UserLandingView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/21/22.
//
import SwiftUI

struct UserLandingView: View {
        
    @ObservedObject var sessionListViewModel = SessionListViewModel()
    //@ObservedObject var miniCharDataViewModel = MiniChartDataViewModel()
        
    var body: some View {
        VStack{
            //Chart
            //Text("Chart Goes here")
            TimeLineView(sessions: sessionListViewModel.sessions)
                .padding(.vertical)
            
            //Text("Session list goes here")
            //List of Dates and Happy/Sad Labels
            MiniListView(sessions: sessionListViewModel.sessions)
            
            NavigationLink { // destination
                RecordSessionView()
            } label: {
                CustomButtonLabel(buttonLabel: "Record Session")
            }
        }
    }
}

struct UserLandingView_Previews: PreviewProvider {
    static var previews: some View {
        UserLandingView()
    }
}
