//
//  AppSettingsView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/22/22.
//

import SwiftUI

struct AppSettingsView: View {
    @State var changeColor: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("pale")
                .ignoresSafeArea()
            
            VStack {
                Group{
                    Image(systemName: "gear")
                        .frame(width: 110, height: 110)
                        .font(.system(size: 100))
                        .foregroundColor(Color("medium"))
                    
                    Text("App Settings")
                        .font(.system(size: 40))
                }
                
                Spacer()
                
                if changeColor {
                    Image(systemName: "switch.2")
                        .font(.system(size: 50))
                }
                
                VStack(alignment: .leading) {
                    Text("Toggle Color Scheme")
                        .font(.system(size: 25))
                    
                    Toggle("Change Color Theme", isOn: $changeColor)
                        .padding()
                }
                
                Spacer()
            }
        }
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}
