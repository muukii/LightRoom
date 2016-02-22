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
let filter1 = LightRoom.ColorAdjustment.ColorControls(saturation: 1.2, brightness: 0, contrast: 1)
let filter2 = LightRoom.ColorEffect.PhotoEffectChrome()
let filterChain1 = FilterChain(filterComponents: [filter1, filter2])
```

![](sample1.png)


### Multiple Chaining

You can be connected to FilterChain each other with `~~>`

```
let filter3 = LightRoom.ColorAdjustment.ColorControls(saturation: 1, brightness: -0.2, contrast: 1)
let filter4 = LightRoom.ColorEffect.PhotoEffectProcess()
let filterChain2 = FilterChain(filterComponents: [filter3, filter4])
```

![](sample2.png)


### Performance

FilterComponent has CIFilter.
CIFilter are cached, it will be created only once.

This structure is advantageous in performance.

To exert the performance at the time of the real-time filtering camera implementation.
