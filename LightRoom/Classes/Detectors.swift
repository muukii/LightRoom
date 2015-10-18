//
//  Detector.swift
//  LightRoom
//
//  Created by Muukii on 8/2/15.
//  Copyright (c) 2015 muukii. All rights reserved.
//

import Foundation
import CoreImage

public typealias QRCodeDetector = CIImage -> [String]
public enum Detectors {
    
    public static func QRCode() -> QRCodeDetector {
        return { image in
            
            let detector = CIDetector(
                ofType: CIDetectorTypeQRCode,
                context: nil,
                options: [
                    CIDetectorAccuracy: CIDetectorAccuracyHigh,
                ])
            let features = detector.featuresInImage(image) as! [CIQRCodeFeature]
            
            let messageStrings: [String] = features.map { $0.messageString } ?? []
            return messageStrings
        }
    }
}
