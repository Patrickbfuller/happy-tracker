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
 
        LoginView()
//        Group {
//            if viewModel.userSession == nil {
//                LoginView()
//            } else {
//                MainUserView()
//            }
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
