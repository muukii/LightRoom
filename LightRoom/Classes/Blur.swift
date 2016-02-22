//
//  Blur.swift
//  LightRoom
//
//  Created by Muukii on 8/4/15.
//  Copyright (c) 2015 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    /*!
    CICategoryBlur
    */
    public enum Blur {

        /*!
        CIBoxBlur
        Blurs an image using a box-shaped convolution kernel.

        :param: radius

        :returns: Filter
        */
        @available(iOS 9.0, OSX 10.5, *)
        public final class BoxBlur: CIFilterComponent {

            public required init(radius: Double) {

                super.init(filterName: "CIBoxBlur", parameters: [
                    kCIInputRadiusKey: radius,
                    ]
                )
            }
        }

        /*!
        CIDiscBlur

        Blurs an image using a disc-shaped convolution kernel.

        :param: radius

        :returns: Filter
        */
        @available(iOS 9.0, OSX 10.5, *)
        public final class DiscBlur: CIFilterComponent {

            public required init(radius: Double) {

                super.init(filterName: "CIDiscBlur", parameters: [
                    kCIInputRadiusKey: radius,
                    ]
                )
            }
        }

        /*!
        CIGaussianBlur

        Spreads source pixels by an amount specified by a Gaussian distribution.

        :param: radius

        :returns:
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class GaussianBlur: CIFilterComponent {

            public required init(radius: Double) {

                super.init(filterName: "CIGaussianBlur", parameters: [
                    kCIInputRadiusKey: radius,
                    ]
                )
            }
        }

        /*!
        CIMedianFilter

        Discussion
        The effect is to reduce noise.

        :returns:
        */
        @available(iOS 9.0, OSX 10.4, *)
        public final class MedianBlur: CIFilterComponent {

            public required init() {

                super.init(filterName: "CIMedianFilter", parameters: [:])
            }
        }

        /*!
        CIMotionBlur

        Blurs an image to simulate the effect of using a camera that moves a specified angle and distance while capturing the image.

        :param: radius
        :param: angle

        :returns:
        */
        @available(iOS 9.0, OSX 10.4, *)
        public final class MotionBlur: CIFilterComponent {

            public required init(radius: Double, angle: Double) {

                super.init(filterName: "CIMotionBlur", parameters: [
                    kCIInputRadiusKey: radius,
                    kCIInputAngleKey: angle,
                    ]
                )
            }
        }

        /*!
        CINoiseReduction

        :param: noiseLevel
        :param: sharpness

        :returns:
        */
        @available(iOS 9.0, OSX 10.4, *)
        public final class NoiseReduction: CIFilterComponent {

            public required init(noiseLevel: Double, sharpness: Double) {

                super.init(filterName: "CINoiseReduction", parameters: [
                    "inputNoiseLevel": noiseLevel,
                    kCIInputSharpnessKey: sharpness,
                    ]
                )
            }
        }

        /*!
        CIZoomBlur

        Simulates the effect of zooming the camera while capturing the image.

        :param: center
        :param: amount

        :returns:
        */
        @available(iOS 9.0, OSX 10.4, *)
        public final class ZoomBlur: CIFilterComponent {

            public required init(center: Vector2, amount: Double) {

                super.init(filterName: "CIZoomBlur", parameters: [
                    kCIInputCenterKey: center.CIVector,
                    "inputAmount": amount,
                    ]
                )
            }
        }
    }
}
