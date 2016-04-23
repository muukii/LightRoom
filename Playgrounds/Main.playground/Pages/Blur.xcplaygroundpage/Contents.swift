//: [Previous](@previous)

import Foundation
import LightRoom

let large = CIImage(image: [#Image(imageLiteral: "sample-large.jpg")#])!
let small = CIImage(image: [#Image(imageLiteral: "sample-small.jpg")#])!

let clamp = LightRoom.TileEffect.AffineClamp(transform: nil)
let blurLarge = LightRoom.Blur.GaussianBlur(radius: 10)
let blurSmall = LightRoom.Blur.GaussianBlur(radius: 5)
//let blur = LightRoom.Stylize.Crystallize(radius: 10, center: nil)


(large >>> clamp >>> blurLarge).outputImage?.imageByCroppingToRect(large.extent)
(small >>> clamp >>> blurSmall).outputImage?.imageByCroppingToRect(small.extent)
//: [Next](@next)
