//: Playground - noun: a place where people can play

import UIKit
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

image.properties
let filter = LightRoom.ColorAdjustment.colorPolynomial(
    redCoefficients: [0,0.4,0.6,0],
    greenCoefficients: [0,1,0,0],
    blueCoefficients: [0,1,0,0],
    alphaCoefficients: [0,1,0,0])
let result = filter(image)



