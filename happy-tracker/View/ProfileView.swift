//
//  ProfileView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/22/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "person.circle")
                .frame(width: 110, height: 110)
                .font(.system(size: 100))
                .foregroundColor(Color("medium"))
            
            Text("User Profile")
                .font(.system(size: 40))
            
            ProfileInfoView(text: "User Name Here", imageName: nil)
            
            ProfileInfoView(text: "User email", imageName: "envelope.fill")
            
            Button("Edit Profile") {}
            
            Spacer()
        }
        .background(Color("pale"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
