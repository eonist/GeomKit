import CoreGraphics
/**
 * Side
 */
extension CGRectParser { public class Side {} }
extension CGRectParser.Side {
   /**
    * Returns an array with Line instances of all sides of a rectangle
    */
   public static func sides(rect: CGRect) -> [Line] {
      return [topSide(rect: rect), rightSide(rect: rect), bottomSide(rect: rect), leftSide(rect: rect)]
   }
   public static func topSide(rect: CGRect) -> Line {
      return .init(p1: rect.topLeft, p2: .init(x: rect.right.x, y: rect.top.y))
   }
   public static func rightSide(rect: CGRect) -> Line {
      return .init(p1: .init(x: rect.right.x, y: rect.top.y), p2: rect.bottomRight)
   }
   public static func bottomSide(rect: CGRect) -> Line {
      return .init(p1: rect.bottomRight, p2: .init(x: rect.left.x, y: rect.bottom.y))
   }
   public static func leftSide(rect: CGRect) -> Line {
      return .init(p1: .init(x: rect.left.x, y: rect.bottom.y), p2: rect.topLeft)
   }
}
