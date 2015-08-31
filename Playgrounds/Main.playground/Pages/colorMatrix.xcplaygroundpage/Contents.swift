//: [Previous](@previous)

import Foundation

import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

let filter = LightRoom.ColorAdjustment.colorMatrix(
    rVector: [2,0,0,0],
    gVector: [0,2,0,0],
    bVector: [0,0,2,0],
    aVector: [0,0,0,2]
)
let result = filter(image)
