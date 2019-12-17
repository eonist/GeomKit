import CoreGraphics
/**
 * Offset
 */
fileprivate typealias CGRectangle = CGRect
extension CGRectangle {
   /**
    * Negative inset equals outset
    */
   public func outset(dx: CGFloat, dy: CGFloat) -> CGRect {
      return insetBy(dx: -dx, dy: -dy)
   }
   /**
    * - Note:  Same as insetBy, but this method is simpler to call, similar to Outset (Convenience)
    */
   public func inset(dx: CGFloat, dy: CGFloat) -> CGRect {
      return insetBy(dx: dx, dy: dy)
   }
   public func offset(dx: CGFloat, dy: CGFloat) -> CGRect { // Convenience
      return self.offsetBy(dx: dx, dy: dy)
   }
   public func offset(point: CGPoint) -> CGRect { // Convenience
      return self.offsetBy(dx: point.x, dy: point.y)
   }
   /**
    * - Note:  Alters the original CGRect instance
    * - Note: Swift 3 update, as of swift 3 CGRect no longer has the offsetInPlace method. This method replaces that functionality.
    * - Fixme: ⚠️️ ⚠️️ could probably be simplified by just copying the origin.x and origin y onto self
    */
   public mutating func offsetInPlace(point: CGPoint) -> CGRect { // Convenience
      let offsetRect: CGRect = self.offset(point: point)
      self.origin = offsetRect.origin
      return self
   }
}
