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
    
    @State var showLivePrediction = true
    @State var error = true
    @State var showHint = true
    @State var isRecording = true
    
    var transparentBackground = Color.black.opacity(0.5)
    
    var body: some View {
        
        ZStack {
            /// Placeholder for Camera Feed from viewModel
            Rectangle().foregroundColor(Color(red: 0.11, green: 0.3, blue: 0.3))
                .ignoresSafeArea()
            
            VStack {
                /// Top Tools
                ZStack {
                    HStack {
                        /// Back Button
                        Button {
                            /// dismiss view (go back)
                        } label: {
                            Text("< back")
                        }
                        Spacer()
                        /// Info Button
                        Button {
                            withAnimation {
                                showHint.toggle()
                            }
                        } label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }
                    }
                    
                    /// Vanishable Prediction
                    if showLivePrediction {
                        Spacer()
                        LivePredictionView(predictionLabel: "happy")
                        Spacer()
                    }
                }
                .padding()
                .background(transparentBackground)
                
                /// Error Box
                if error {
                    CameraErrorView()
                }
                /// HintBox
                if showHint {
                    HintView()
                        .onTapGesture {
                            withAnimation {
                                showHint.toggle()
                            }
                        }
                }
                /// ^^^ Top Tools
                Spacer()
                
                /// Bottom Tools
                
                ZStack {
                    StartStopButton(isRecording: $isRecording)
                        .onTapGesture { isRecording.toggle()}
                    
                    if isRecording {
                        HStack {
                            RecordingTimerView()
                            Spacer()
                        }
                    }
                }
                
                /// Prediction Toggle
                PredictionToggle(showLivePrediction: $showLivePrediction)
            }
        }
        
    }
}

struct LivePredictionView: View {
    
    var predictionLabel: String
    
    var body: some View {
        Text(predictionLabel)
            .fontWeight(.black)
            .font(.title)
            .foregroundColor( predictionLabel == "happy" ? .green : .white)
    }
}

struct CameraErrorView: View {
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack {
                Text("error:")
                    .fontWeight(.black)
                Text("description\nof nerror")
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
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.black.opacity(0.5))
                .frame(width: 50, height: 50)
            Text("13")
                .foregroundColor(.red)
        }
    }
}

struct StartStopButton: View {
    
    
    @Binding var isRecording: Bool
    var buttonLabel: String {
        isRecording ? "Stop" : "Start"
    }
    
    var body: some View {
        Button {
            // action
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
