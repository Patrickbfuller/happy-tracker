//
//  MainUserView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/21/22.
//
import SwiftUI

struct MainUserView: View {
    @State var showSideMenu: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var sessionListViewModel = SessionListViewModel()
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                
                Color("pale")
                    .ignoresSafeArea(.all)
                
                if sessionListViewModel.sessions.isEmpty {
                    GetStartedView()
                } else {
                UserLandingView()
                    .environmentObject(sessionListViewModel)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .navigationBarHidden(showSideMenu)
                }
                if showSideMenu {
                    ZStack {
                        Color(.black)
                            .opacity(showSideMenu ? 0.25 : 0.0)
                            .ignoresSafeArea(.all)
                    }.onTapGesture {
                        withAnimation(.easeOut) {
                            showSideMenu = false
                        }
                    }
                }
                
                SideMenuView(showThis: $showSideMenu)
                    .frame(width: 300)
                    .offset(x: showSideMenu ? 0 : -300, y: 0)
                    .background(showSideMenu ? Color.white : Color.clear)
                    .alert("Error loading your user data. Please logout.", isPresented: $viewModel.isDisabled) {
                        Button("Logout") {
                            //print(viewModel.currentUser)
                            viewModel.signOut()
                        }
                    }
                
                
            }
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeOut){
                        showSideMenu.toggle()
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .frame(width: 30, height: 30)
                        .font(.system(size: 35))
                        .foregroundColor(Color("medium"))
                }
            }
        }
        .onAppear{
            showSideMenu = false
            //print(viewModel.currentUser)
        }
    }
}

struct MainUserView_Previews: PreviewProvider {
    static var previews: some View {
        MainUserView()
            .environmentObject(AuthViewModel())
    }
}
