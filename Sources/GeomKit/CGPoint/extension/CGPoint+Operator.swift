import CoreGraphics
/**
 * Convenient operators
 */
extension CGPoint {
   /**
    * Adds the coordinates of point p to the coordinates of this point to create a new point
    */
   public static func + (a: CGPoint, b: CGPoint) -> CGPoint { CGPointModifier.add(a: a, b: b) }
   /**
    * Subtracts the coordinates of point p from the coordinates of this point to create a new point.
    */
   public static func - (a: CGPoint, b: CGPoint) -> CGPoint { CGPointModifier.substract(a: a, b: b) }
   /**
    * Modifies a by adding b
    */
   public static func += ( a: inout CGPoint, b: CGPoint) { a.x += b.x; a.y += b.y; }
   /**
    * Modifies a by substracting b
    */
   public static func -= ( a: inout CGPoint, b: CGPoint) { a.x -= b.x; a.y -= b.y; }
   /**
    * Multiplies two CGPoint values and returns the result as a new CGPoint.
    */
   public static func * (left: CGPoint, right: CGPoint) -> CGPoint { CGPointModifier.multiply(a: left, b: right) }
   /**
    * Multiplies a CGPoint with another.
    */
   public static func *= ( left: inout CGPoint, right: CGPoint) { left = left * right }
   /**
    * Multiplies the x and y fields of a CGPoint with the same scalar value and (returns the result as a new CGPoint.)
    */
   public static func * (point: CGPoint, scalar: CGFloat) -> CGPoint { .init(x: point.x * scalar, y: point.y * scalar) }
   /**
    * Multiplies the x and y fields of a CGPoint with the same scalar value.
    */
   public static func *= ( point: inout CGPoint, scalar: CGFloat) { point = point * scalar }
   /**
    * Divides two CGPoint values and returns the result as a new CGPoint.
    */
   public static func / (left: CGPoint, right: CGPoint) -> CGPoint { CGPointModifier.divide(a: left, b: right) }
   /**
    * Divides a CGPoint by another.
    */
   public static func /= ( left: inout CGPoint, right: CGPoint) { left = left / right }
   /**
    * Divides the x and y fields of a CGPoint by the same scalar value and returns (the result as a new CGPoint.)
    */
   public static func / (point: CGPoint, scalar: CGFloat) -> CGPoint { .init(x: point.x / scalar, y: point.y / scalar) }
   /**
    * Divides the x and y fields of a CGPoint by the same scalar value.
    */
   public static func /= ( point: inout CGPoint, scalar: CGFloat) { point = point / scalar }
}
