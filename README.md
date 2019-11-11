[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
[![Build Status](https://travis-ci.com/eonist/GeomKit.svg?branch=master)](https://travis-ci.com/eonist/GeomKit)
[![codebeat badge](https://codebeat.co/badges/bdda373a-6022-49be-949b-dece00d40a10)](https://codebeat.co/projects/github-com-eonist-geomsugar-master)
![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.1-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/GraphicsLib.svg">

### What is it
Geometry classes

### How do I get it
- Carthage `github "eonist/GeomKit" "master"`
- Manual Open `GeomKit.xcodeproj`
- CocoaPod (Coming soon)

### Example:

```swift
let rect: CGRect = .init(origin: .zero, size: .init(width: 100, height: 100))
let cgPath = CGRectParser.roundRect(rect: rect, radius: 20)
let shapeLayer: CAShapeLayer = .init()
CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
self.view.layer.addSublayer(shapeLayer)
```

### Todo:
- Add HoundCI ✅
- Add SPM to GeomKit 👈
- Write example ✅
- Write UnitTests ✅
