//
//  EmotionPrediction.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/25/22.
//

import Foundation

struct EmotionPrediction {
    
    let emotionIndex: Double
    
    var emotion: String {
        switch emotionIndex {
        case 0..<0.33:
            return "sad"
        case 0.33..<0.66:
            return "neutral"
        default:
            return "happy"
        }
    }
    
    init(happyConf: Double, sadConf: Double) {
        emotionIndex = 0.5 + 0.5 * (happyConf - sadConf)
    }
}
