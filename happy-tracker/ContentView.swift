//
//  ContentView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/21/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
 
        Group {
            //no user logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                //have a logged in user
                MainUserView()
                    //.preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
