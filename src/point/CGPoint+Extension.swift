import Foundation
// Class methods
let π = CGFloat(Double.pi) // Global variable

extension CGPoint {
   static func polarPoint(radius: CGFloat, angle: CGFloat) -> CGPoint { // Convenience
      return CGPointParser.polar(radius: radius, angle: angle)
   }
   static func distance(a: CGPoint, b: CGPoint) -> CGFloat { // Convenience
      return CGPointParser.distance(a: a, b: b)
   }
   static func interpolate(_ a: CGPoint, _ b: CGPoint, _ scalar: CGFloat) -> CGPoint { // Convenience
      return CGPointParser.interpolate(a: a, b: b, scalar: scalar)
   }
}
// Convenient extensions
extension CGPoint{
   // Initiaters
   // deperecate the bellow ⚠️️
   public init(_ x: Double, _ y: Double) { self.init(x: CGFloat(x), y: CGFloat(y))} // Init a CGPoint with Double values
   public init(_ x: Int, _ y: Int) { self.init(x: CGFloat(x), y: CGFloat(y)) } // Init a CGPoint with Int values
   public init(_ x: CGFloat, _ y: CGFloat) { self.init(x: x, y: y) } // Init a CGPoint with CGFloat values (this method differes from the default by omitting the required argument names)
   // Parsers
   public func distance(_ p: CGPoint) -> CGFloat { return CGPoint.distance(a: self, b: p) } // distance from self to p
   public func polarPoint(_ radius: CGFloat, _ angle: CGFloat) -> CGPoint { return self + CGPoint.polarPoint(radius: radius, angle: angle) } // polarPoint from self
   // func polar(radius: CGFloat, _ angle: CGFloat) -> CGPoint { return polarPoint(radius, angle) }//convenience and legacy support
   public func interpolate(_ to: CGPoint, _ scalar: CGFloat) -> CGPoint { return CGPoint.interpolate(self, to, scalar) } // interpolate from self to b by scalar
   public func copy() -> CGPoint { return CGPoint(self.x, self.y) }
   public func clone() -> CGPoint { return CGPoint(self.x, self.y) }
   public func add(_ p: CGPoint) -> CGPoint { return CGPointParser.add(a: self, b: p) }
   public func subtract(_ p: CGPoint) -> CGPoint { return CGPointParser.substract(a: self, b: p) }
   public func multiply(_ p: CGPoint) -> CGPoint { return CGPointParser.multiply(a: self, b: p) }
   public func divide(_ p: CGPoint) -> CGPoint { return CGPointParser.divide(a: self, b: p) }
   // Asserters
   public func equals(_ p: CGPoint) -> Bool { return CGPointAsserter.equals(p1: self, p) }
   public func isNear(_ p: CGPoint, _ epsilon: CGFloat) -> Bool { return CGPointAsserter.nearEquals(a: self, b: p, epsilon: epsilon) }
}
/**
 * ## Examples: CGPoint(x: 20, y: 30)[.hor] // 20
 */
//    subscript(dir: Dir) -> CGFloat {/*Convenience*/
//        get {
//            switch dir {
//                case .hor:
//                    return self.x
//                case .ver:
//                    return self.y
//            }
//        } set {
//            switch dir {
//                case .hor:
//                    self.x = newValue
//                case .ver:
//                    self.y = newValue
//            }
//        }
//    }


