//
//  LightRoom.swift
//  LightRoom
//
//  Created by Muukii on 7/28/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import QuartzCore

/**
About Core Image
https://developer.apple.com/library/mac/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_intro/ci_intro.html

Filters
https://developer.apple.com/library/prerelease/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html
*/

public enum LightRoom {
    
}

public struct Vector: ArrayLiteralConvertible {
    
    private let v: [CGFloat]
    public init(arrayLiteral elements: CGFloat...) {
        
        self.v = elements
    }
    
    public var CIVector: CoreImage.CIVector {
        
        switch self.v.count {
        case 1:
            return CoreImage.CIVector(x: v[0])
        case 2:
            return CoreImage.CIVector(x: v[0], y: v[1])
        case 3:
            return CoreImage.CIVector(x: v[0], y: v[1], z: v[2])
        case 4:
            return CoreImage.CIVector(x: v[0], y: v[1], z: v[2], w: v[3])
        case 10:
            return CoreImage.CIVector(values: v, count: 10)
        default:
            return CoreImage.CIVector(x: 0, y: 0, z: 0, w: 0)
        }
    }
}

public typealias Filter = CIImage -> CIImage

infix operator >>> { associativity left }
public func >>> (filter1: Filter, filter2: Filter) -> Filter {
    return { image in filter2(filter1(image)) }
}

