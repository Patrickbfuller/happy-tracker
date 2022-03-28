//
//  RecordingDoneView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/28/22.
//

import SwiftUI

struct RecordingDoneView: View {
    
    @EnvironmentObject var sessionViewModel: SessionViewModel
    
    @State var description = "5-20 words describing your feelings"
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
            VStack(spacing: 0) {
                
                HStack {
                    Button { // action
                        sessionViewModel.cancelSession()
                    } label: {
                        Text("Cancel Entry")
                            .padding()
                    }
                    Spacer()
                }
                
                TextEditor(text: $description)
                    .padding(8)
                    .foregroundColor(.black)
                    .background(.white)
                
                Button { // action
                    sessionViewModel.submitSession()
                } label: {
                    Text("Submit Entry")
                        .fontWeight(.semibold)
                        .padding()
                }
            }
            
            .background(Color("medium"))
            
            .frame(minHeight: 200, idealHeight: 400, maxHeight: 400)
            .cornerRadius(20)

            .padding(2)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 5))
            .foregroundColor(.white)
            .padding(30)
        }
    }
}

struct RecordingDoneView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingDoneView()
            .environmentObject(SessionViewModel())
    }
}
