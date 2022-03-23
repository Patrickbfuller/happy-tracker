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
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .appSettings{
                    NavigationLink{
                        AppSettingsView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        print("Logout here")
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
                
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
