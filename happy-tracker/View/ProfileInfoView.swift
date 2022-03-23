//
//  ProfileInfoView.swift
//  happy-tracker
//
//  Created by Alexander Davila-Wollheim on 3/22/22.
//
import SwiftUI

struct ProfileInfoView: View {
    let text: String
    let imageName: String?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName ?? "")
                    .foregroundColor(Color("medium"))
                Text(text)
            })
            .padding(.all)
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView(text: "Hello", imageName: "mail.fill")
            .previewLayout(.sizeThatFits)
    }
}
