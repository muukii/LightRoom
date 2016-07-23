//: [Previous](@previous)

import Foundation
import LightRoom
import GLKit

var str = "Hello, playground"

let image1 = CIImage(image: #imageLiteral(resourceName: "sample.jpg"))!

let areaHistogram = LightRoom.Reduction.AreaHistogram(extent: [0, 0, image1.extent.width, image1.extent.height], count: 256, scale: 1)
let histogram = LightRoom.Reduction.HistogramDisplayFilter(height: 500, highLimit: 1, lowLimit: 0)

image1

let arerHistogramImage = (image1 >>> areaHistogram).outputImage!

let image = (arerHistogramImage >>> histogram).outputImage!

arerHistogramImage.extent

let eaglContext = EAGLContext(api: .openGLES2)
let context = CIContext(eaglContext: eaglContext!, options: [kCIContextOutputColorSpace:NSNull()])

let bufferSize = 256 * 4
var bitmap = Array<CGFloat>(repeating: 0.0, count: bufferSize)
try! bitmap.withUnsafeMutableBufferPointer { buffer in
    
    context.render(arerHistogramImage, toBitmap: buffer.baseAddress!, rowBytes: bufferSize, bounds: arerHistogramImage.extent, format: kCIFormatRGBAf, colorSpace: nil)
}

print(bitmap)