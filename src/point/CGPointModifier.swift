import Foundation

public class CGPointModifier {
   /**
    * Returns a new point comprised of the addition of two points
    */
   public static func add(a: CGPoint, b: CGPoint) -> CGPoint {
      return .init(a.x + b.x, a.y + b.y)
   }
   /**
    * Returns a new point comprised of the subtraction of two points
    */
   public static func substract(a: CGPoint, b: CGPoint) -> CGPoint {
      return .init(a.x - b.x, a.y - b.y)
   }
   /**
    * Returns a new point comprised of the division of two points
    */
   public static func divide(a: CGPoint, b: CGPoint) -> CGPoint {
      return .init(a.x / b.x, a.y / b.y)
   }
   /**
    * Returns the multiplication of two points
    * ## Examples:  PointParser.multiply(CGPoint(20,20), CGPoint(2,2))//Output: (40,40)
    */
   public static func multiply(a: CGPoint, b: CGPoint) -> CGPoint {
      return .init(a.x * b.x, a.y * b.y)
   }
   /**
    * Multiplies x and y in - Parameter: point with - Parameter: multiplier
    */
   public static func multiply(point: CGPoint, multiplier: CGFloat) -> CGPoint {
      return .init(point.x * multiplier, point.y * multiplier)
   }
   /**
    * Rotates a point around a given pivot point
    * - Parameter: point The point to rotate.
    * - Parameter: pivot the pivot point that - Parameter: point is roatated around.
    * - Parameter: rot the amount in which to rotate (radians)
    * - Note: this function does not alter the original point
    * - Note: this function is keept around to illustrate how to rotate a point around a pivot in regular trig math (Also may be faster than the equvilant function that uses matrix math)
    * - Fixme: ⚠️️ rename to trigRot?!?
    */
   public static func rot(point: CGPoint, pivot: CGPoint, rot: CGFloat) -> CGPoint {
      let x: CGFloat = pivot.x + ( cos(rot) * (point.x - pivot.x) - sin(rot) * (point.y - pivot.y))
      let y: CGFloat = pivot.y + ( sin(rot) * (point.x - pivot.x) + cos(rot) * (point.y - pivot.y))
      return .init(x, y)
   }
}
