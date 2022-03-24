//
//  ContentView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Log in view")
                }
                
                NavigationLink {
                    RecordSessionView()
                } label: {
                    Text("record session view")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
