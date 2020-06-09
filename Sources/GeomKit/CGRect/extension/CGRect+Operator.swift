import CoreGraphics
/**
 * Extension
 */
extension CGRect {
   /**
    * Adds the coordinates of point p to the coordinates of this point to create a new point
    */
   public static func + (a: CGRect, b: CGPoint) -> CGRect {
      .init(x: a.minX + b.x, y: a.minY + b.y, width: a.width, height: a.height)
   }
   /**
    * Modifies a by adding b, could also have used: offsetBy()
    */
   public static func += (a: inout CGRect, b: CGPoint) {
      a.origin.x += b.x
      a.origin.y += b.y
   }
   /**
    * Modifies a by adding b, could also have used: offsetBy()
    */
   public static func -= (a: inout CGRect, b: CGPoint) {
      a.origin.x -= b.x
      a.origin.y -= b.y
   }
   /**
    * Addition
    */
   public static func + (a: CGRect, b: CGRect) -> CGRect {
      .init(origin: a.origin + b.origin, size: .init(width: a.size.width + b.size.width, height: a.size.height + b.size.height))
   }
   /**
    * Subtraction
    */
   public static func - (a: CGRect, b: CGRect) -> CGRect {
      .init(origin: a.origin - b.origin, size: .init(width: a.size.width - b.size.width, height: a.size.height - b.size.height))
   }
   /**
    * Multiplication
    */
   public static func * (a: CGRect, b: CGRect) -> CGRect {
      .init(origin: a.origin * b.origin, size: .init(width: a.size.width * b.size.width, height: a.size.height * b.size.height))
   }
}
