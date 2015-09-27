//: Playground - noun: a place where people can play

import UIKit
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

LightRoom.ColorAdjustment.colorControls(saturation: 1, brightness: 0, contrast: 1)(image)

LightRoom.ColorAdjustment.exposureAdjust(ev: 1)(image)
//let result = Filters.Blur.motionBlur(radius: 20, angle: 0.2)(image)

let filter = LightRoom.ColorAdjustment.colorPolynomial(
    redCoefficients: [0,0.4,0.6,0],
    greenCoefficients: [0,1,0,0],
    blueCoefficients: [0,1,0,0],
    alphaCoefficients: [0,1,0,0]) >>> LightRoom.Blur.motionBlur(radius: 20, angle: 0.2)
let result = filter(image)



