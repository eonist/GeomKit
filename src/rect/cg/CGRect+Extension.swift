import Foundation
/**
 * Move the logic into CGRectModifier and CGRectParser and CGRectAsserter
 * For rect.isWithin(point) use: rect.contains(point)
 * - Note: lots of Convenient CGRect methods here: https://github.com/nschum/SwiftCGRectExtensions/blob/master/CGRectExtensions/CGRectExtensions.swift
 */
extension CGRect {
   /**
    * Clones CGRect
    * ## Examples:  CGRect(0,0,100,100).clone()
    */
   public func clone() -> CGRect { // remove this, use copy instead
      return .init(self.origin.x, self.origin.y, self.width, self.height)
   }
   /**
    * Same as clone (Consistency)
    */
   public func copy() -> CGRect {
      return .init(self.origin.x, self.origin.y, self.width, self.height)
   }
   /**
    * Create a path using the coordinates of the rect passed in
    * ## Examples:  CGRect(0,0,100,100).path
    */
   public var path: CGMutablePath { return CGRectParser.path(rect: self) }
   // Initialization
   public init(_ pos: CGPoint, _ size: CGSize) { self.init(origin: pos, size: size) }
   public init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) { self.init(origin: CGPoint(x, y), size: CGSize( width: width, height: height)) }//- Fixme: ⚠️️add initializer to CGSize
   public init(_ x: Double, _ y: Double, _ width: Double, _ height: Double) { self.init(origin: CGPoint(x, y), size: CGSize( width: width, height: height)) }//- Fixme: ⚠️️add initializer to CGSize
   public init(_ x: CGFloat, _ y: CGFloat, _ width: Double, _ height: Double) { self.init(origin: CGPoint(x, y), size: CGSize( width: width, height: height)) }
   public init(_ x: Int, _ y: Int, _ width: Double, _ height: Double) { self.init(origin: CGPoint(x, y), size: CGSize( width: width, height: height)) }
   // Position
   public var x: CGFloat { set { origin.x = newValue } get { return origin.x } }
   public var y: CGFloat { set { origin.y = newValue } get { return origin.y } }
   // Size
   /*var width: CGFloat {set {size.width = newValue} get {return size.width} }
    var height: CGFloat {set {size.height = newValue} get {return size.height} }*/
   /*⚠️️ - Note:  Siwft3 seems to have problems with width get and height get as extensions so use w and h instead. set worked for some reason but still*/
   public var w: CGFloat { set { size.width = newValue } get { return size.width } }
   public var h: CGFloat { set { size.height = newValue } get { return size.height } }
   // Corners
   public var topLeft: CGPoint { return self.origin }
   public var point: CGPoint { return self.origin }
   public var bottomLeft: CGPoint { return .init(self.minX, self.maxY) }
   public var bottomRight: CGPoint { return .init(self.maxX, self.maxY) }
   public var topRight: CGPoint { return .init(self.maxX, self.minY) }
   public var center: CGPoint { return .init(self.midX, self.midY) }
   public var top: CGPoint { return .init(self.midX, self.minY) }
   public var bottom: CGPoint { return .init(self.midX, self.maxY) }
   public var left: CGPoint { return .init(self.maxX, self.midY) }
   public var right: CGPoint { return .init(self.minX, self.midY) }
   public var corners: [CGPoint] { return CGRectParser.corners(rect: self) }
   public var sides: [CGPoint] { return CGRectParser.sides(rect: self) }
   /**
    * Negative inset equals outset
    */
   public func outset(_ dx: CGFloat, _ dy: CGFloat) -> CGRect {
      return insetBy(dx: -dx, dy: -dy)
   }
   /**
    * - Note:  Same as insetBy, but this method is simpler to call, similar to Outset (Convenience)
    */
   public func inset(_ dx: CGFloat, _ dy: CGFloat) -> CGRect {
      return insetBy(dx: dx, dy: dy)
   }
   public func offset(_ dx: CGFloat, _ dy: CGFloat) -> CGRect { // Convenience
      return self.offsetBy(dx: dx, dy: dy)
   }
   public func offset(_ point: CGPoint) -> CGRect { // Convenience
      return self.offsetBy(dx: point.x, dy: point.y)
   }
   /**
    * - Note:  Alters the original CGRect instance
    * Swift 3 update, as of swift 3 CGRect no longer has the offsetInPlace method. This method replaces that functionality.
    * - Fixme: ⚠️️ ⚠️️ could probably be simplified by just copying the origin.x and origin y onto self
    */
   public mutating func offsetInPlace(_ point: CGPoint) -> CGRect { // Convenience
      let offsetRect: CGRect = self.offset(point)
      self.origin = offsetRect.origin
      return self
   }
   /**
    * Expands the size of the rect from its pivot
    */
   public func expand(_ dx: CGFloat, _ dy: CGFloat) -> CGRect {
      return CGRect(self.x, self.y, self.width + dx, self.height + dy)
   }
}
/**
 * Extension
 */
extension CGRect {
   public static func + (a: CGRect, b: CGPoint) -> CGRect { return .init(a.x + b.x, a.y + b.y, a.width, a.height) }//Adds the coordinates of point p to the coordinates of this point to create a new point
   public static func += (a: inout CGRect, b: CGPoint) { a.x += b.x;a.y += b.y; } // modifies a by adding b, could also have used: offsetBy()
   public static func -= (a: inout CGRect, b: CGPoint) { a.x -= b.x;a.y -= b.y; } // modifies a by adding b, could also have used: offsetBy()
   public static func + (a: CGRect, b: CGRect) -> CGRect { return .init(origin: a.origin + b.origin, size: CGSize(width: a.size.width + b.size.width, height: a.size.height + b.size.height)) }
   public static func - (a: CGRect, b: CGRect) -> CGRect { return .init(origin: a.origin - b.origin, size: CGSize(width: a.size.width - b.size.width, height: a.size.height - b.size.height)) }
   public static func * (a: CGRect, b: CGRect) -> CGRect { return .init(origin: a.origin * b.origin, size: CGSize(width: a.size.width * b.size.width, height: a.size.height * b.size.height)) }
}
//public func -(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width - b.width,a.height - b.height)}
//public func * (a: CGSize, b: CGSize) -> CGSize {return CGSize(a.w*b.w, a.h*b.h)}

//    var nsRect: NSRect { return NSRectFromCGRect(self) }
/**
 * - Fixme: ⚠️️ Maybe for x,y,width,height aswell?
 * - Fixme: ⚠️️ Make it enum! it's faster
 */
//    subscript(key: Alignment) -> CGPoint {/*Easy Access to corners*/
//        get {
//            switch key{
//            case .topLeft: return topLeft
//            case .topRight: return topRight
//            case .bottomRight: return bottomRight
//            case .bottomLeft: return bottomLeft
//            case .topCenter: return top
//            case .bottomCenter: return bottom
//            case .centerLeft: return left
//            case .centerRight: return right
//            case .centerCenter: return center
//            }
//        }
//        set {
//            fatalError("UNSUPORTED CORNER TYPE: " + key.rawValue + " WITH VALUE: " + String(describing: newValue))
//        }
//    }
