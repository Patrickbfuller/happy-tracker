//
//  LiveCamViewModel.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/23/22.
//

import Vision


class LiveCamViewModel: ObservableObject {
    
    @Published var frame: CGImage?
    @Published var cameraError: CameraError?
    @Published var cvpBuffer: CVPixelBuffer?
    @Published var bufferPrediction: BufferPrediction?
    
    private let cameraManager = CameraManager.shared
    private let frameManager = FrameManager.shared
    
    
    init() {
        setupSubscriptions()
    }
    
    func startCamera() {
        if cameraManager.status == .unconfigured {
            cameraManager.configure()
        }
        cameraManager.session.startRunning()
    }
    
    func stopCamera() {
        cameraManager.session.stopRunning()
    }
    
    func setupSubscriptions() {
        
        
        /// Pass along any camera errors from camera manager
        cameraManager.$error
            .receive(on: RunLoop.main)
            .assign(to: &$cameraError)
        
        /// Pass along visual stream as cgimage for frame view
        frameManager.$current
            .receive(on: RunLoop.main)
            .compactMap { cvpBuffer in
                print("Getting updated buffer")
                return CGImage.create(from: cvpBuffer)
            }
            .assign(to: &$frame)
    }
}
