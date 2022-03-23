//
//  RegisterView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/21/22.
//

import SwiftUI


struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        
        VStack {
            HStack{
                //arrow
                Image(systemName: "arrow.backward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding()
                
                //text
                Text("back to login")
                Spacer()
            }
            .padding(.leading, 20)
            
            Spacer()
            
            LogoView()
            
            Spacer()
            
            
            VStack(alignment: .leading, spacing: 20){
                
                //name input
                CustomAuthLabel(label: "Name")
                
                CustomTextField(placeholder: "enter name",
                                inputText: $email,
                                isSecure: false)
                
                
                //email input
                CustomAuthLabel(label: "Email")
                
                CustomTextField(placeholder: "enter email",
                                inputText: $email,
                                isSecure: false)
                
                
                //password input
                
                CustomAuthLabel(label: "Password")
                
                CustomTextField(placeholder: "enter password",
                                inputText: $password,
                                isSecure: true)
                
                
                //confirm password
                
                CustomAuthLabel(label: "Confirm password")
                
                CustomTextField(placeholder: "enter password",
                                inputText: $password,
                                isSecure: true)
                
                
            }
            .padding(.leading, 20)
            .padding(.bottom, 40)
            
            // Login button (roundy Button)
            CustomButton(buttonLabel: "Register") {
                // button action
            } 
            
            Spacer()
            
            // newUser->Register (texty button)
            
        }
        .background(Color("pale").opacity(0.2))
        
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
