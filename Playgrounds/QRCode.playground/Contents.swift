//: Playground - noun: a place where people can play

import LightRoom

func foo(image: CIImage) -> [String] {
    
    print(image, appendNewLine: true)
    let detector = CIDetector(
        ofType: CIDetectorTypeQRCode,
        context: nil,
        options: [
            :
        ])
    
    print(detector, appendNewLine: true)
    if let features = detector.featuresInImage(image) as? [CIQRCodeFeature] {
        features
        let messageStrings: [String] = features.map { $0.messageString } ?? []
        return messageStrings
    }
    return []
}

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("qrcode", ofType: "png")!)!)!

//let result = Detectors.QRCode()(image)
//result

foo(image)
