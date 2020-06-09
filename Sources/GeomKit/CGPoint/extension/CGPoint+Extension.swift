import CoreGraphics
// Class methods
public let π = CGFloat(Double.pi) // Global variable
/**
 * Aritmetic
 */
extension CGPoint {
   public func clone() -> CGPoint { CGPoint(x: self.x, y: self.y) }
   public func add(p: CGPoint) -> CGPoint { CGPointModifier.add(a: self, b: p) }
   public func subtract(p: CGPoint) -> CGPoint { CGPointModifier.substract(a: self, b: p) }
   public func multiply(p: CGPoint) -> CGPoint { CGPointModifier.multiply(a: self, b: p) }
   public func divide(p: CGPoint) -> CGPoint { CGPointModifier.divide(a: self, b: p) }
}
/**
 * Trigonometri
 */
extension CGPoint {
   /**
    * Distance from self to p
    */
   public func distance(p: CGPoint) -> CGFloat {
      CGPoint.distance(a: self, b: p)
   }
   /**
    * interpolate from self to b by scalar
    */
   public func interpolate(to: CGPoint, scalar: CGFloat) -> CGPoint {
      CGPoint.interpolate(a: self, b: to, scalar: scalar)
   }
   /**
    * polarPoint from self
    * ## Examples:
    * CGPoint(x: 100, y: 100).polarPoint(radius: 50, angle: CGFloat.PI / 2) // 140, 140 ish
    */
   public func polarPoint(radius: CGFloat, angle: CGFloat) -> CGPoint {
      self + CGPoint.polarPoint(radius: radius, angle: angle)
   }
   /**
    * ## Examples:
    * CGPoint.polarPoint(radius: 50, angle: CGFloat.PI / 2) // 40, 40 ish
    */
   public static func polarPoint(radius: CGFloat, angle: CGFloat) -> CGPoint {
      CGPointTrig.polar(radius: radius, angle: angle)
   }
   public static func distance(a: CGPoint, b: CGPoint) -> CGFloat {
      CGPointParser.distance(a: a, b: b)
   }
   public static func interpolate(a: CGPoint, b: CGPoint, scalar: CGFloat) -> CGPoint {
      CGPointParser.interpolate(a: a, b: b, scalar: scalar)
   }
}
/**
 * Asserters
 */
extension CGPoint {
   public func equals(_ p: CGPoint) -> Bool { CGPointAsserter.equals(p1: self, p) }
   public func isNear(_ p: CGPoint, _ epsilon: CGFloat) -> Bool { CGPointAsserter.nearEquals(a: self, b: p, epsilon: epsilon) }
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
