//
//  LivePredictionView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/24/22.
//

import SwiftUI

struct LivePredictionView: View {
    
    @EnvironmentObject var frameManager: FrameManager
    
    var predictionLabel = "happy"
        
    var body: some View {
        Text(predictionLabel.capitalized)
            .fontWeight(.black)
            .font(.title)
            .foregroundColor( predictionLabel == "happy" ? .green : .white)
            .onReceive(frameManager.$current) { cvpBuffer in
                //makePrediction
            }
    }
}
