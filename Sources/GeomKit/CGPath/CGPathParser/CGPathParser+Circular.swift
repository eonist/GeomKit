import CoreGraphics
/**
 * Circular
 */
extension CGPathParser {
   /**
    * Convenince method
    */
   public static func ellipse( rect: CGRect) -> CGMutablePath {
      return ellipse(center: rect.origin, size: rect.size)
   }
   /**
    * Draws an ellipse from the center
    */
   public static func ellipse( center: CGPoint, size: CGSize) -> CGMutablePath {
      let point: CGPoint = .init(x: center.x - (size.width / 2), y: center.y - (size.height / 2))
      return ellipse(rect: .init(origin: point, size: size))
   }
   /**
    * ## Examples: CGPathParser.ellipse(100, 200)
    * - Important: ⚠️️ The ellipse is drawn from top left position
    * - Note: you may add convenience methods for drawing ellipses from the center later
    * - Fixme: ⚠️️ ⚠️️ impliment the transformation param, it's currently inactive
    */
   public static func ellipse(rect: CGRect, transformation: CGAffineTransform? = nil) -> CGMutablePath {
      let ellipsePath: CGMutablePath  = .init()
      ellipsePath.addEllipse(in: rect)
      return ellipsePath
   }
   /**
    * RoundRect with only w and h of all 4 corners (SVG uses this method)
    */
   public static func roundRect( rect: CGRect, cornerheight: CGFloat, cornerWidth: CGFloat) -> CGMutablePath {
      let path: CGMutablePath = .init()
      path.addRoundedRect(in: rect, cornerWidth: cornerWidth, cornerHeight: cornerheight)
      return path
   }
}

