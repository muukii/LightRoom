//: Playground - noun: a place where people can play

import UIKit
import LightRoom
import SwiftyJSON

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("garden", ofType: "jpg")!)!)!

//LightRoom.Stylize.HighlightShadowAdjust(highlightAmount: 2, shadowAmount: 0).filter(image)
//LightRoom.ColorAdjustment.GammmaAdjust(power: 0.7).filter(image)


let image1 = LightRoom.CombinedFilter.Grain(intencity: 0.5).filter(image)







