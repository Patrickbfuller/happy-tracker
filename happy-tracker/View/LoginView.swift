//
//  LoginView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/21/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Happy Tracker??")
            // Logo
            LogoView()
            
            Spacer()
            
            
            VStack(alignment: .leading) {
                
                Text("Log In")
                    .fontWeight(.black)
                    .font(.title)
                    .padding(.bottom)
                
                // Email and pass section
                // email label
                CustomAuthLabel(label: "Email")
                
                // email input
                CustomTextField(placeholder: "enter email", inputText: $email, isSecure: false)
                
                // Pass label
                CustomAuthLabel(label: "Password")
                
                // Pass input
                CustomTextField(placeholder: "enter password", inputText: $password, isSecure: true)
                
            }
            .padding(.leading, 20)
            .padding(.bottom, 40)
            
            // Login button (roundy Button)
            CustomButton(buttonLabel: "Login") {
                // button action
            }
            
            Spacer()
            
            // newUser->Register (texty button)
            Button("new user? register->") {}
        }
        .background(Color("pale").opacity(0.2))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
