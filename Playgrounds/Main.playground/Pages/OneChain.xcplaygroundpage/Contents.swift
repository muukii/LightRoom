//: [Previous](@previous)

import Foundation
import LightRoom

let image = CIImage(image: [#Image(imageLiteral: "sample.jpg")#])


let filter1 = LightRoom.ColorAdjustment.ColorControls(saturation: 1.2, brightness: 0, contrast: 1)
let filter2 = LightRoom.ColorEffect.PhotoEffectChrome()

let filterChain = FilterChain(filterComponents: [filter1, filter2])

filterChain.inputImage = image
filterChain.outputImage


//: [Next](@next)
