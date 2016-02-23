import UIKit
import LightRoom

let image1 = CIImage(image: [#Image(imageLiteral: "sample.jpg")#])!
let image2 = CIImage(image: [#Image(imageLiteral: "sample3.jpg")#])!

let colorControl = LightRoom.ColorAdjustment.ExposureAdjust(ev: 1)

let chain1 = FilterChain { (image: CIImage?) -> CIImage? in
    image >>> colorControl
    return colorControl.outputImage
}

let colorControl2 = LightRoom.ColorAdjustment.ColorControls(saturation: 0.3, brightness: 0, contrast: 1)
let chain2 = FilterChain { (image: CIImage?) -> CIImage? in
    image >>> colorControl2
    return colorControl2.outputImage
}

image1 >>> chain1 >>> chain2
chain2.outputImage