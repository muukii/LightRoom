//: [Previous](@previous)

import Foundation
import LightRoom

let image = CIImage(image: [#Image(imageLiteral: "sample.jpg")#])

let filter1 = LightRoom.ColorAdjustment.ColorControls(saturation: 1.2, brightness: 0, contrast: 1)
let filter2 = LightRoom.ColorEffect.PhotoEffectChrome()
let filterChain1 = FilterChain(filterComponents: [filter1, filter2])

let filter3 = LightRoom.ColorAdjustment.ColorControls(saturation: 1, brightness: -0.2, contrast: 1)
let filter4 = LightRoom.ColorEffect.PhotoEffectProcess()
let filterChain2 = FilterChain(filterComponents: [filter3, filter4])

let filterChain = filterChain1 ~~> filterChain2
filterChain.inputImage = image
filterChain.outputImage

//: [Next](@next)


