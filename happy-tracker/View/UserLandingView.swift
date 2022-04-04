//
//  UserLandingView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/21/22.
//
import SwiftUI

struct UserLandingView: View {
        
    @ObservedObject var sessionListViewModel = SessionListViewModel()
        
    var body: some View {
        VStack{
            //Chart
            //Text("Chart Goes here")
            MiniChartView()
                .padding(.vertical)
            
            //Text("Session list goes here")
            //List of Dates and Happy/Sad Labels
            MiniListView(sessions: sessionListViewModel.sessions)
            

            CustomButton(buttonLabel: "Print sessions") {
                print("\nDEBUG\n")
                sessionListViewModel.sessions.forEach { session in
                    print(session.comment)
                }
                print("\nDEBUG\n")
            }
            
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
