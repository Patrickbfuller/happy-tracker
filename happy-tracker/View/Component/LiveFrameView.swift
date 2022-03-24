//
//  LiveFrameView.swift
//  happy-tracker
//
//  Created by Patrick Fuller on 3/23/22.
//

import SwiftUI

struct LiveFrameView: View {
    
    var image: CGImage?
    
    init(cvpBuffer: CVPixelBuffer?) {
        if let cvpBuffer = cvpBuffer {
            self.image = CGImage.create(from: cvpBuffer)
        }
    }
    
    var body: some View {
        
        if let image = image {
            GeometryReader { geo in
                Image(
                    decorative: image,
                    scale: 1.0,
                    orientation: .upMirrored
                ).resizable()
                    .scaledToFill()
                    .frame(
                        width: geo.size.width,
                        height: geo.size.height)
                    .clipped()
            }
        } else {
            Color.black
        }
    }
}

//struct FrameView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveFrameView()
//    }
//}
