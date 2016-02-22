//: [Previous](@previous)

import Foundation
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

let blur = LightRoom.Blur.BoxBlur(radius: 30)
let matrix = LightRoom.ColorAdjustment.ColorMatrix(rVector: [0,0,0,0], gVector: [0,1,0,0], bVector: [0,0,1,0], aVector: [0,0,0,1], biasVector: [0,0,0,0])


let chain = FilterChain()
chain.addFilterComponent(blur)
chain.addFilterComponent(matrix)

chain.inputImage = image
chain.outputImage

//: [Next](@next)
