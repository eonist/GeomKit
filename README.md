![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.1-orange.svg)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
[![codebeat badge](https://codebeat.co/badges/bdda373a-6022-49be-949b-dece00d40a10)](https://codebeat.co/projects/github-com-eonist-geomsugar-master)
[![Github actions badge](https://badgen.net/github/checks/eonist/GeomKit?icon=github&label=Tests)](https://github.com/eonist/GeomKit/actions)

### Features:
- Common geometry methods

### Installation:
- Swift package manager ` "https://github.com/eonist/GeomKit"` target `"master"`
- Manual Open `GeomKit.xcodeproj`

### Example:
```swift
let rect: CGRect = .init(origin: .zero, size: .init(width: 100, height: 100))
let cgPath = CGRectParser.roundRect(rect: rect, radius: 20)
let shapeLayer: CAShapeLayer = .init()
CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
self.view.layer.addSublayer(shapeLayer)
```
