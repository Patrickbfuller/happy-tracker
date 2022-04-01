//
//  SideMenuView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/21/22.
//
import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State var logoutAlert: Bool = false
    @State private var disabled = true
    
    @Binding var showThis: Bool
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 35) {
                VStack(alignment: .leading){
                    Button{
                        withAnimation(.easeIn){
                            showThis.toggle()
                        }
                    } label: {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("medium"))
                    }
                    
                    Text(user.name.capitalized)
                    //Text("user name")
                        .font(.headline)
                    
                    Text(user.email)
                    //Text("user email")
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
                            logoutAlert = true
                            //authViewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                        .alert(isPresented: $logoutAlert) {
                            Alert(
                                title: Text("Confirm Log Out"),
                                message: Text("Are you sure you want to Log Out?"), primaryButton: .destructive(Text("Logout"), action: {
                                    authViewModel.signOut()
                                }), secondaryButton: .cancel())
                        }
                        
                    } else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    
                }
                
                Spacer()
            }
            .background(Color(UIColor.systemBackground))
        }
        //====================END OF IF=================
        else {
            VStack(alignment: .leading, spacing: 35) {
                VStack(alignment: .leading){
                    Button{
                        withAnimation(.easeIn){
                            showThis.toggle()
                        }
                    } label: {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color("medium"))
                    }
                    
                    Text("404ERROR")
                    //Text("user name")
                        .font(.headline)
                    
                    Text("404ERROR")
                    //Text("user email")
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
                        }.disabled(disabled)
                    } else if viewModel == .appSettings{
                        NavigationLink{
                            AppSettingsView()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }.disabled(disabled)
                    } else if viewModel == .logout {
                        Button {
                            logoutAlert = true
                            //authViewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                        .alert(isPresented: $logoutAlert) {
                            Alert(
                                title: Text("Confirm Log Out"),
                                message: Text("Are you sure you want to Log Out?"), primaryButton: .destructive(Text("Logout"), action: {
                                    authViewModel.signOut()
                                }), secondaryButton: .cancel())
                        }
                        
                    } else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    
                }
                
                Spacer()
            }
            .background(Color(UIColor.systemBackground))
        }
        //====================END OF ELSE=================
    }
    //====================END OF BODY=================
}
//====================END OF VIEW=================

//struct SideMenuView_Previews: PreviewProvider {
//    @State var previewBindingBool = true
//    static var previews: some View {
//        SideMenuView(showThis: $previewBindingBool)
//            //.environmentObject(AuthViewModel())
//    }
//}
