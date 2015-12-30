# LightRoom
ImageFilter with CoreImage

---

# A Work In Progress

In order to better interface, API might change frequently.

# Example

```swift
import LightRoom

let image: CIImage = ...

let filterGen: FilterGen = LightRoom.Sharpen.SharpenLuminance(sharpness: 0.2)

filterGen.filter(image)
```

# Create Combined Filter

```swift
let colorMatrixFilter = LightRoom.ColorAdjustment.ExposureAdjust(ev: 0.1).filter
let motionBlurFilter = LightRoom.Blur.MotionBlur(radius: 10, angle: 0.2).filter

let combinedFilter = colorMatrixFilter >>> motionBlurFilter

let outputImage = combinedFilter(image)
```

# Bridge Filter <-> JSON

## Create Filter from JSON

WIP

## Export JSON from Filter

WIP



---

![](example1.png)