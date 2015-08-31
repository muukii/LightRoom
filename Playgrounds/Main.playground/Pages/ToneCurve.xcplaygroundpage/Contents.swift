//: [Previous](@previous)

import Foundation
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

func toneCurve(
    point0 point0: Vector = [0.00,0.00],
    point1: Vector?,
    point2: Vector?,
    point3: Vector?,
    point4: Vector = [1.00,1.00]) -> Filter {
        
        return { image in
            
            var parameters: [String: AnyObject] = [kCIInputImageKey: image]
            
            parameters["inputPoint0"] = point0.CIVector
            parameters["inputPoint1"] = point1?.CIVector
            parameters["inputPoint2"] = point2?.CIVector
            parameters["inputPoint3"] = point3?.CIVector
            parameters["inputPoint4"] = point4.CIVector
            
            let filter = CIFilter(name: "CIToneCurve", withInputParameters: parameters)
            return filter!.outputImage!
        }
}

toneCurve(
    point0: [0,0],
    point1: nil,
    point2: nil,
    point3: [0.2,0.5],
    point4: [1.1])(image)

