//
//  UserLandingView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/21/22.
//
import SwiftUI

struct UserLandingView: View {
        
    @EnvironmentObject var sessionListViewModel: SessionListViewModel

    
    var body: some View {
        VStack{
            //Chart
            //Text("Chart Goes here")
            if sessionListViewModel.sessions != nil {
            TimeLineView(sessions: sessionListViewModel.sessions!.reversed())
                .padding(.horizontal, 8)
                .padding(.top, 5)
            } else {
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 40))
            }
            
            //Text("Session list goes here")
            //List of Dates and Happy/Sad Labels

            MiniListView()
                .environmentObject(sessionListViewModel)
            
            NavigationLink { // destination
                RecordSessionView()
            } label: {
                CustomButtonLabel(buttonLabel: "Record Session")
            }
        }
    }
}

//struct UserLandingView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserLandingView()
//    }
//}
