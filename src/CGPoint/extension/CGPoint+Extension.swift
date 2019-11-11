import Foundation
// Class methods
let π = CGFloat(Double.pi) // Global variable
/**
 * Aritmetic
 */
extension CGPoint {
   public func clone() -> CGPoint { return CGPoint(x: self.x, y: self.y) }
   public func add(p: CGPoint) -> CGPoint { return CGPointModifier.add(a: self, b: p) }
   public func subtract(p: CGPoint) -> CGPoint { return CGPointModifier.substract(a: self, b: p) }
   public func multiply(p: CGPoint) -> CGPoint { return CGPointModifier.multiply(a: self, b: p) }
   public func divide(p: CGPoint) -> CGPoint { return CGPointModifier.divide(a: self, b: p) }
}
/**
 * Trigonometri
 */
extension CGPoint {
   /**
    * Distance from self to p
    */
   public func distance(p: CGPoint) -> CGFloat {
      return CGPoint.distance(a: self, b: p)
   }
   /**
    * interpolate from self to b by scalar
    */
   public func interpolate(to: CGPoint, scalar: CGFloat) -> CGPoint {
      return CGPoint.interpolate(a: self, b: to, scalar: scalar)
   }
   /**
    * polarPoint from self
    */
   public func polarPoint(radius: CGFloat, angle: CGFloat) -> CGPoint {
      return self + CGPoint.polarPoint(radius: radius, angle: angle)
   }
   static func polarPoint(radius: CGFloat, angle: CGFloat) -> CGPoint {
      return CGPointTrig.polar(radius: radius, angle: angle)
   }
   static func distance(a: CGPoint, b: CGPoint) -> CGFloat {
      return CGPointParser.distance(a: a, b: b)
   }
   static func interpolate(a: CGPoint, b: CGPoint, scalar: CGFloat) -> CGPoint {
      return CGPointParser.interpolate(a: a, b: b, scalar: scalar)
   }
}
/**
 * Asserters
 */
extension CGPoint {
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
