//
//  CustomButton.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/21/22.
//

import SwiftUI

struct CustomButton: View {
    
    var buttonLabel: String
    
    var action: () -> Void
    
    var body: some View {
        Button {
            // action
            action()
            
        } label: {
            
            Text(buttonLabel)
            // styling
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(height: 45)
                .padding(.horizontal)
                .font(.title2)
                .background(Color("medium"))
                .clipShape(Capsule())
        }
    }
}
