//
//  Filter.swift
//  LightRoom
//
//  Created by Muukii on 7/28/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import QuartzCore

public typealias Filter = CIImage -> CIImage

infix operator >>> { associativity left }
public func >>> (filter1: Filter, filter2: Filter) -> Filter {
    return { image in filter2(filter1(image)) }
}

public enum Filters {
    
    public static func blur(radius: Double) -> Filter {
        return { image in
            
            let parameters = [
                kCIInputRadiusKey: radius,
                kCIInputImageKey: image,
            ]
            
            let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: parameters)
            
            return filter!.outputImage
        }
    }
}