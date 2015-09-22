//: [Previous](@previous)

import Foundation
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

func toneCurve(
    rPoints rPoints: [Vector2],
    gPoints: [Vector2],
    bPoints: [Vector2],
    rgbPoints: [Vector2]) -> Filter {
        
        return { image in
            
            
            let rImage = LightRoom.ColorAdjustment.toneCurve(
                point0: rPoints[0],
                point1: rPoints[1],
                point2: rPoints[2],
                point3: rPoints[3],
                point4: rPoints[4])(LightRoom.ColorAdjustment.colorMatrix(
                    rVector: [1,0,0,0],
                    gVector: [0,0,0,0],
                    bVector: [0,0,0,0],
                    aVector: [0,0,0,1],
                    biasVector: [0,0,0,0])(image))
            
            let gImage = LightRoom.ColorAdjustment.toneCurve(
                point0: gPoints[0],
                point1: gPoints[1],
                point2: gPoints[2],
                point3: gPoints[3],
                point4: gPoints[4])(LightRoom.ColorAdjustment.colorMatrix(
                    rVector: [0,0,0,0],
                    gVector: [0,1,0,0],
                    bVector: [0,0,0,0],
                    aVector: [0,0,0,1],
                    biasVector: [0,0,0,0])(image))
            
            let bImage = LightRoom.ColorAdjustment.toneCurve(
                point0: bPoints[0],
                point1: bPoints[1],
                point2: bPoints[2],
                point3: bPoints[3],
                point4: bPoints[4])(LightRoom.ColorAdjustment.colorMatrix(
                    rVector: [0,0,0,0],
                    gVector: [0,0,0,0],
                    bVector: [0,0,1,0],
                    aVector: [0,0,0,1],
                    biasVector: [0,0,0,0])(image))
            
            let screenBlend = LightRoom.CompositeOperation.lightenBlendMode()
            
            let blendImage = screenBlend(
                image: screenBlend(image: rImage, backgroundImage: bImage),
                backgroundImage: gImage)
            
            return LightRoom.ColorAdjustment.toneCurve(
                point0: rgbPoints[0],
                point1: rgbPoints[1],
                point2: rgbPoints[2],
                point3: rgbPoints[3],
                point4: rgbPoints[4])(blendImage)
        }
}


let filter = toneCurve(
    rPoints: [
        [0.3, 0.3],
        [0.3, 0.3],
        [0.5, 0.5],
        [0.7, 0.7],
        [0.9, 0.9],
    ],
    gPoints: [
        [0.1, 0.1],
        [0.3, 0.3],
        [0.5, 0.5],
        [0.7, 0.7],
        [0.9, 0.9],
    ],
    bPoints: [
        [0.1, 0.1],
        [0.3, 0.3],
        [0.5, 0.5],
        [0.7, 0.7],
        [0.9, 0.9],
    ],
    rgbPoints: [
        [0.1, 0.1],
        [0.3, 0.3],
        [0.5, 0.5],
        [0.7, 0.7],
        [0.9, 0.9],
    ])(image)
