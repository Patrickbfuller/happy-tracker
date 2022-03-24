//
//  ImageClassifier.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/24/22.
//

import Vision

class ImageClassifier {
    
    static let shared = createImageClassifier()

    private init() {}
    
    // apple sample code
// https://developer.apple.com/documentation/vision/classifying_images_with_vision_and_core_ml
    static func createImageClassifier() -> VNCoreMLModel {
        // Use a default model configuration.
        let defaultConfig = MLModelConfiguration()

        // Create an instance of the image classifier's wrapper class.
        let imageClassifierWrapper = try? EmotionRecognitionClassifierHNS(configuration: defaultConfig)

        guard let imageClassifier = imageClassifierWrapper else {
            fatalError("App failed to create an image classifier model instance.")
        }

        // Get the underlying model instance.
        let imageClassifierModel = imageClassifier.model

        // Create a Vision instance using the image classifier's model instance.
        guard let imageClassifierVisionModel = try? VNCoreMLModel(for: imageClassifierModel) else {
            fatalError("App failed to create a `VNCoreMLModel` instance.")
        }

        return imageClassifierVisionModel
    }
}
