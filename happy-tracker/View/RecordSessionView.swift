//
//  RecordSessionView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/21/22.
//

import SwiftUI

struct RecordSessionView: View {
    
    /*
     STORY POINTS: 1
     - Hide side panel menu if its part of this view
     - have button to go BACK to main landing home
     - Hiding camera error view
     - phonewide - view for the camera
     - start/stop record session
     - have toggle button for live emotion monitoring
     */
    
    @State var showingLivePrediction = true
    @State var showingHint = true
    @State var isRecording = false
    
    @ObservedObject var stopwatch = Stopwatch()
    @ObservedObject var cameraManager = CameraManager.shared
    @ObservedObject var frameManager = FrameManager.shared
    
    var transparentBackground = Color.black.opacity(0.5)
    
    var body: some View {
        
        ZStack {
            /// Placeholder for Camera Feed from viewModel
            Rectangle().foregroundColor(Color(red: 0.11, green: 0.3, blue: 0.3))
                .ignoresSafeArea()
            
            /// Visual Feed
            LiveFrameView(cvpBuffer: frameManager.current)
                .ignoresSafeArea()
                .onAppear {
                    if cameraManager.status == .unconfigured {
                        cameraManager.configure()
                    }
                    cameraManager.session.startRunning()
                }
                .onDisappear {
                    cameraManager.session.stopRunning()
                }
            
            VStack {
                /// Color to influence nav bar background
                transparentBackground.ignoresSafeArea()
                    .frame(height: 0)
                
                
                /// Vanishable  Live Prediction View
                if showingLivePrediction {
                    LivePredictionView().environmentObject(frameManager)
                }
                
                /// Error Box
                if cameraManager.error != nil {
                    CameraErrorView(cameraManager.error!)
                }

                /// HintBox - tappable
                if showingHint {
                    HintView()
                        .onTapGesture {
                            withAnimation {
                                showingHint.toggle()
                            }
                        }
                }
                /// ^^^ Top Tools
                Spacer()
                
                /// Bottom Tools
                
                ZStack {
                    /// Start/Stop Record Button
                    StartStopButton(isRecording: $isRecording).environmentObject(stopwatch)
                    
                    /// Vanishable Stopwatch Timer
                    if isRecording {
                        HStack {
                            RecordingTimerView().environmentObject(stopwatch)
                                .padding(.leading)
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Vanishable Prediction Label
            ToolbarItem(placement: .principal) {
                ShowHidePredictionButton(showingPrediction: $showingLivePrediction)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                InfoButton(bindingBool: $showingHint)
            }
        }
    }
}

struct ShowHidePredictionButton: View {
    
    @Binding var showingPrediction: Bool
    
    var body: some View {
        Button { // action
            withAnimation {
                showingPrediction.toggle()
            }
        } label: {
            Text("\(showingPrediction ? "Hide" : "Show") prediction")
        }
        .foregroundColor(.white)
        .padding(5)
        .background(Color("medium"))
        .cornerRadius(5)
        .padding(5)
    }
}

class Stopwatch: ObservableObject {
    
    @Published var time = 0
    
    var timer: Timer = Timer.init()
    
    func startStop() {
        if timer.isValid {
            timer.invalidate()
        } else {
            self.time = 0
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    self.time += 1
                }
            }
        }
    }
}

struct InfoButton: View {
    
    @Binding var bindingBool: Bool
    
    var body: some View {
        Button {
            withAnimation {
                bindingBool.toggle()
            }
        } label: {
            Image(systemName: "info.circle")
                .foregroundColor(.white)
                .font(.system(size: 25))
        }
    }
}


struct CameraErrorView: View {
    
    var cameraError: CameraError
    
    init(_ cameraError: CameraError) {
        self.cameraError = cameraError
    }
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack {
                Text("error:")
                    .fontWeight(.black)
                Text("\(cameraError.description)")
                    .lineLimit(nil)
            }
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .background(.red)
        
    }
}

struct HintView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Record a short video in which you describe your feelings")
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .background(Color("light"))
    }
}

struct RecordingTimerView: View {
    
    @EnvironmentObject var stopwatch: Stopwatch
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.black.opacity(0.5))
                .frame(width: 50, height: 50)
            Text("\(stopwatch.time)")
                .foregroundColor(.red)
        }
    }
}

struct StartStopButton: View {
    
    @EnvironmentObject var stopwatch: Stopwatch
    
    @Binding var isRecording: Bool
    var buttonLabel: String {
        isRecording ? "Stop" : "Start"
    }
        
    var body: some View {
        Button { // action
            stopwatch.startStop()
            withAnimation {
                isRecording.toggle()
            }
        } label: {
            // label
            Text(buttonLabel)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(.red)
                .clipShape(Capsule())
        }
    }
}

struct PredictionToggle: View {
    
    @Binding var showLivePrediction: Bool
    
    var body: some View {
        Toggle(isOn: $showLivePrediction) {
            // Label
            Text("Show Prediction")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.leading)
        }
        .tint(Color("light"))
        .padding(12)
        .background(Color.black.opacity(0.5))
    }
}

struct RecordSessionView_Previews: PreviewProvider {
    static var previews: some View {
        RecordSessionView()
    }
}
