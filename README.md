# LightRoom
ImageFilter with CoreImage

---

Steadily in development.


# Example

```swift
import LightRoom

let image: CIImage = ...

LightRoom.Sharpen.sharpenLuminance(sharpness: 0.2)(image)
```

# Create Combined Filter

```swift
let colorMatrixFilter = LightRoom.ColorAdjustment.exposureAdjust(ev: 0.1)
let motionBlurFilter = LightRoom.Blur.motionBlur(radius: 10, angle: 0.2)

let combinedFilter = colorMatrixFilter >>> motionBlurFilter

let outputImage = combinedFilter(image)
```


---

![](example1.png)
