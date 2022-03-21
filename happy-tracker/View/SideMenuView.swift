//
//  SideMenuView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/21/22.
//

import SwiftUI

struct SideMenuView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 35) {
            VStack(alignment: .leading){
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("medium"))
                
                Text("Users Name")
                    .font(.headline)
                
                Text("Usersemail@email.com")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                HStack(spacing: 16) {
                    Image(systemName: option.imageName)
                    
                    Text(option.menuOption)
                    
                    Spacer()
                }
                .frame(height:40)
                .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
