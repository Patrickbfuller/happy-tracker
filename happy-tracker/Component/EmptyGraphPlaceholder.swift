//
//  EmptyGraphPlaceholder.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 4/12/22.
//

import SwiftUI

struct EmptyGraphPlaceholder: View {
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                Color.gray.opacity(0.2)
                VStack {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .resizable()
                        .frame(width: geo.size.width / 4, height: geo.size.height / 3)
                    Text("Description of what is here and what to do")
                        .lineLimit(nil)
                }
            }
        }
    }
}

struct EmptyGraphPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        EmptyGraphPlaceholder()
    }
}
