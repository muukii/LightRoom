//: [Previous](@previous)

import Foundation
import UIKit
import CoreImage
import LightRoom

let image = CIImage(image: [#Image(imageLiteral: "sample.jpg")#])!
let alpha: CGFloat = 0.1

let color = CIColor(red: 1, green: 1, blue: 1, alpha: alpha)

let fadeImage = LightRoom.Generator.ConstantColorGenerator(cropRect: image.extent, color: color)
let sourceOver = LightRoom.CompositeOperation.SourceOverCompositing()
let control = LightRoom.ColorAdjustment.ColorControls(saturation: 0.5, brightness: 0, contrast: 1)

let chain1 = FilterChain { (image) -> CIImage? in
    fadeImage.cropRect = image?.extent ?? .zero
    image >>> control --* sourceOver
    fadeImage >>> sourceOver
    return sourceOver.outputImage
}

image --> chain1
chain1.outputImage

do {
    let image2 = CIImage(image: [#Image(imageLiteral: "sample2.jpg")#])!
    
    image2 --> chain1
    chain1.outputImage
}

//: [Next](@next)
