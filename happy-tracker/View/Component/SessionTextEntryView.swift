//
//  RecordingDoneView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/28/22.
//

import SwiftUI

struct SessionTextEntryView: View {
    
    @EnvironmentObject var sessionViewModel: SessionViewModel
    
    @State var description = "5-20 words describing your feelings"
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                
                ZStack {
                    TextEditor(text: $description)
                        .padding(8)
                        .foregroundColor(Color.primary)
                        .background(Color(UIColor.systemBackground))
                }
                
                HStack {
                    Button { // action
                        sessionViewModel.resetSession()
                    } label: {
                        Text("Cancel Entry")
                            .padding()
                    }
                    Button { // action
                        sessionViewModel.submitSession(comment: description)
                    } label: {
                        Text("Submit Entry")
                            .fontWeight(.semibold)
                            .padding()
                    }
                }
            }
            
            .background(Color("medium"))
            .foregroundColor(Color(UIColor.systemBackground))
            
            .frame(minHeight: 200, idealHeight: 400, maxHeight: 400)
            .cornerRadius(20)
            
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2))
            .foregroundColor(.white)
            .padding(30)
        }
    }
}

struct RecordingDoneView_Previews: PreviewProvider {
    static var previews: some View {
        SessionTextEntryView()
            .environmentObject(SessionViewModel())
    }
}
