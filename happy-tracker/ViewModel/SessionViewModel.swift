//
//  SessionViewModel.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/28/22.
//

import Foundation
import Combine
import SwiftUI

class SessionViewModel: ObservableObject {
    
    var stopwatch = Stopwatch()
    @Published var stopwatchCounter = 0
    
    private var frameCount = 0
    private var sumHappyConfidence = 0.0
    private var sumSadConfidence = 0.0
    
    private var cancellables = [AnyCancellable]()
    
    @Published var status = Status.notStarted
    
    enum Status {
        case notStarted
        case isRecording
        case gettingText
        case done
    }
    
    init() {
        // set up stopwatch subscription
        stopwatch.$time
            .assign(to: &$stopwatchCounter)
        
    }
    
    func startSession() {
        // view will show timerView
        self.status = .isRecording
        // start adding / set up subscription
        // start stopwatch
        stopwatch.startStop()
    }
    
    func stopSession() {
        // stop stopwatch
        stopwatch.startStop()
        // stop adding / cancel subscription
        // view will show text window
        self.status = .gettingText
    }
    
    func submitSession() {
        // view will hide text window & show thank you done window
        self.status = .done
        // persist sessionEntry
        
        // Reset session
        self.frameCount = 0
        self.sumHappyConfidence = 0.0
        self.sumSadConfidence = 0.0
    }
    
    func cancelSession() {
        // View will revert to beginnig
        self.status = .notStarted
        
        // Reset session
        self.frameCount = 0
        self.sumHappyConfidence = 0.0
        self.sumSadConfidence = 0.0
    }
}
