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
    
    var body: some View {

            GeometryReader { geo in
            ZStack(alignment: .topLeading) {

                Color("pale")
                    .ignoresSafeArea(.all)
                
                UserLandingView()
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
                
                SideMenuView()
                    .frame(width: 300)
                    .offset(x: showSideMenu ? 0 : -300, y: 0)
                    .background(showSideMenu ? Color.white : Color.clear)
                
            }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation(.easeOut){
                            showSideMenu.toggle()
                        }
                    } label: {
                        Image(systemName: "person.circle")
                            .frame(width: 30, height: 30)
                            .font(.system(size: 35))
                            .foregroundColor(Color("medium"))
                    }
                }
            }
            .onAppear{
                showSideMenu = false
                print(viewModel.currentUser)
            }
        }
    }

struct MainUserView_Previews: PreviewProvider {
    static var previews: some View {
        MainUserView()
    }
}
