//: [Previous](@previous)

import Foundation

import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

let filter = LightRoom.ColorAdjustment.colorPolynomial(
    redCoefficients: [0,1,0,0],
    greenCoefficients: [0,1,0,0],
    blueCoefficients: [0,1,0,0],
    alphaCoefficients: [0,1,0,0])
let result = filter(image)
