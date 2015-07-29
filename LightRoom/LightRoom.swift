//
//  LightRoom.swift
//  LightRoom
//
//  Created by Muukii on 7/28/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import QuartzCore

public struct Vector: ArrayLiteralConvertible {
    
    private let values: [CGFloat]
    public init(arrayLiteral elements: CGFloat...) {
        
        self.values = elements
    }
    
    public var CIVector: CoreImage.CIVector {
        
        switch self.values.count {
        case 1:
            return CoreImage.CIVector(x: values[0], y: values[1], z: values[2], w: values[3])
        case 2:
            return CoreImage.CIVector(x: values[0], y: values[1], z: values[2], w: values[3])
        case 3:
            return CoreImage.CIVector(x: values[0], y: values[1], z: values[2], w: values[3])
        case 4:
            return CoreImage.CIVector(x: values[0], y: values[1], z: values[2], w: values[3])
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