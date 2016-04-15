//: [Previous](@previous)

import Foundation
import LightRoom

let image1 = CIImage(image: [#Image(imageLiteral: "sample.jpg")#])!

let clamp = LightRoom.TileEffect.AffineClamp(transform: CGAffineTransformMakeScale(1, 1))
let blur = LightRoom.Blur.GaussianBlur(radius: 10)

let a = (image1 >>> clamp >>> blur)
a.outputImage
//: [Next](@next)
