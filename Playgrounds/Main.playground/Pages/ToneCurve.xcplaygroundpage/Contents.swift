//: [Previous](@previous)

import Foundation
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!


do {
    let image1 = LightRoom.ColorAdjustment.toneCurve(
        point0: [0,0],
        point1: [79.0/255.0,41.0/255.0],
        point2: [142.0/255.0,150.0/255.0],
        point3: [202.0/255.0,218.0/255.0],
        point4: [1,1])(image)
    
    image1
    
}

do {
    let image1 = LightRoom.ColorAdjustment.toneCurve(
        point0: [0,0],
        point1: [0,0],
        point2: [0,0],
        point3: [1,0],
        point4: [1,1])(image)
    
    image1
    
}