//
//  EmptyGraphPlaceholder.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 4/12/22.
//

import SwiftUI

struct EmptyGraphPlaceholder: View {
    
    @State var showingHint: Bool = true
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)//, height: geo.size.height / 3)
                        .foregroundColor(.gray)
                    Text("Your progress will appear here.")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary.opacity(0.8))
                    Text("Please record again tomorrow to visualize your progress.")
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
                Spacer()
            }
            // Z-layer with info button
            HStack {
                Spacer()
                VStack {
                    Button {
                        showingHint.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                    }
                    Spacer()
                }
            }
        }
        .background(.white.opacity(0.85))
        .background(
            LinearGradient(
                colors: [.white, .white, Color("customMint"), .purple, Color("customMint"), .white, .white],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
    
    struct HintView: View {
        
        var body: some View {
            HStack {
                Spacer()
                Text("Your progress will only show once you have multiple")
                Divider()
                Text("In the graph, if you record multiple times in one day, the new session will replace the previous one.")
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .background(Color("customMint").opacity(0.3))
        }
    }
}

struct EmptyGraphPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        EmptyGraphPlaceholder()
    }
}

