# LightRoom
Easy Chaining ImageFilter with CoreImage

---

## Instrallation

LightRoom is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
pod "AppVersionMonitor"
```

## Usage

You need to create FilterComponent.
Then, You add to FilterChain that.

### Chaining

```
image1 >>> colorControl --* addition
             blendImage >>> addition --* overlay
            image2 >>> colorControl2 >>> overlay
```

![](sample_1.png)


### Multiple Chaining

You can be connected to FilterChain each other with `>>>`

```
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
```

![](sample_2.png)


### Performance

FilterComponent has CIFilter.
CIFilter are cached, it will be created only once.

This structure is advantageous in performance.

To exert the performance at the time of the real-time filtering camera implementation.
