//: Playground - noun: a place where people can play

import Foundation
import QuartzCore
import FilterGen
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("garden", ofType: "jpg")!)!)!
image

let rImage = LightRoom.ColorAdjustment.colorMatrix(
    rVector: [0,0,0,0],
    gVector: [0,0,0,0],
    bVector: [0,0,0,0],
    aVector: [0,0,0,0],
    biasVector: [0,0,0,0])(image)

let result = LightRoom.ColorAdjustment.toneCurve(
    point0: [0,0],
    point1: [0,0],
    point2: [0,0],
    point3: [0,0],
    point4: [0,0])(image)

result
//: [Next](@next)
