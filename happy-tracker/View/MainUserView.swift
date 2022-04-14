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
    @StateObject var sessionListViewModel = SessionListViewModel()
    @StateObject var recordSessionViewModel = RecordSessionViewModel()
    
    @State var isLoading = true
    
    var body: some View {
        Group {
            //            if sessionListViewModel.sessions == nil {
            if isLoading || sessionListViewModel.sessions == nil {
                ProgressView()
                    .scaleEffect(3)
            } else {
                GeometryReader { geo in
                    ZStack(alignment: .topLeading) {
                        
                        Color("pale")
                            .ignoresSafeArea(.all)
                        
                        UserLandingView()
                            .environmentObject(recordSessionViewModel)
                            .environmentObject(sessionListViewModel)
                            .frame(width: geo.size.width, height: geo.size.height)
                            .navigationBarHidden(showSideMenu)
                        
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isLoading = false
            }
        }
    }
}

struct MainUserView_Previews: PreviewProvider {
    static var previews: some View {
        MainUserView()
            .environmentObject(AuthViewModel())
    }
}
