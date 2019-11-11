import Foundation
/**
 * Extension
 */
extension CGRect {
   /**
    * Adds the coordinates of point p to the coordinates of this point to create a new point
    */
   public static func + (a: CGRect, b: CGPoint) -> CGRect {
      return .init(a.x + b.x, a.y + b.y, a.width, a.height)
   }
   /**
    * Modifies a by adding b, could also have used: offsetBy()
    */
   public static func += (a: inout CGRect, b: CGPoint) {
      a.x += b.x
      a.y += b.y
   }
   /**
    * Modifies a by adding b, could also have used: offsetBy()
    */
   public static func -= (a: inout CGRect, b: CGPoint) {
      a.x -= b.x
      a.y -= b.y
   }
   /**
    * Addition
    */
   public static func + (a: CGRect, b: CGRect) -> CGRect {
      return .init(origin: a.origin + b.origin, size: .init(width: a.size.width + b.size.width, height: a.size.height + b.size.height))
   }
   /**
    * Subtraction
    */
   public static func - (a: CGRect, b: CGRect) -> CGRect {
      return .init(origin: a.origin - b.origin, size: .init(width: a.size.width - b.size.width, height: a.size.height - b.size.height))
   }
   /**
    * Multiplication
    */
   public static func * (a: CGRect, b: CGRect) -> CGRect {
      return .init(origin: a.origin * b.origin, size: .init(width: a.size.width * b.size.width, height: a.size.height * b.size.height))
   }
}
//public func -(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width - b.width,a.height - b.height)}
//public func * (a: CGSize, b: CGSize) -> CGSize {return CGSize(a.w*b.w, a.h*b.h)}
