//
//  RegisterView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/21/22.
//

import SwiftUI


struct RegisterView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
   
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        
        
        VStack {
        
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
         
        
            }
            .padding(.leading, 20)
            
            Spacer()
            
            LogoView()
            
            Spacer()
            
            
            VStack(alignment: .leading){
                Text("Sign up")
                    .fontWeight(.black)
                    .font(.title)
                    .padding(.bottom)
                //name input
      
                CustomAuthLabel(label: "Name")
                
                CustomTextField(placeholder: "enter name",
                                inputText: $name,
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
            }
            .padding(.leading, 20)
            .padding(.bottom, 40)
            
            // Login button (roundy Button)
            CustomButton(buttonLabel: "Register") {
                // button action
                viewModel.register(withEmail: email,
                                   password: password,
                                   name: name)
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
