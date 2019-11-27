import CoreGraphics

public class CircleParser {
   /**
    * Returns a square that fits inside a circle
    * - Parameter: circleCenter - center of circle
    * - Parameter: radius - radius of circle
    */
   public static func squareInCircle(circleCenter: CGPoint, radius: CGFloat) -> CGRect {
      let side = sqrt(radius * radius * 2)// Calc side length of square
      let half = side * 0.5// Position offset
      let pt: CGPoint = .init(x: circleCenter.x - half, y: circleCenter.y - half)
      return .init(origin: pt, size: .init(width: side, height: side))
   }
}
