//: [Previous](@previous)

import Foundation

import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

do {
    let filter = LightRoom.ColorAdjustment.colorMatrix(
        rVector: [1,0,0,0],
        gVector: [0,1,0,0],
        bVector: [0,0,1,0],
        aVector: [0,0,0,1],
        biasVector: [0,0.05,0,0]
    )
    let result = filter(image)
}

do {
    let filter = LightRoom.ColorAdjustment.colorMatrix(
        rVector: [1,0,0,0],
        gVector: [0,1,0,0],
        bVector: [0,0.1,1,0],
        aVector: [0,0,0,1],
        biasVector: [0.05,0,0,0]
    )
    let result = filter(image)
}
do {
    let filter = LightRoom.ColorAdjustment.colorMatrix(
        rVector: [1,0,0,0],
        gVector: [0,1,0,0],
        bVector: [0,0.1,1,0],
        aVector: [0,0,0,1],
        biasVector: [0,0,0.05,0]
    )
    let result = filter(image)
}

do {
    let filter = LightRoom.ColorAdjustment.colorMatrix(
        rVector: [1,0,0,0],
        gVector: [0,1,0,0],
        bVector: [0,0.1,1,0],
        aVector: [0,0,0,1],
        biasVector: [0,0,0,0]
    )
    let result = filter(image)
}