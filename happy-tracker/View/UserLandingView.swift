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
            Text("Chart Goes here")
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 200)
                .padding(.vertical)
                .foregroundColor(.blue)
            Text("Session list goes here")
            //List of Dates and Happy/Sad Labels
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 200)
                .padding(.vertical)
                .foregroundColor(.blue)
            
//            CustomButton(buttonLabel: "Record Session") {
//                // button action
//            }
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
