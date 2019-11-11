import Foundation
/**
 * Path
 */
extension CGRectParser { public class Path {} }
extension CGRectParser.Path {
   /**
    * Returns A CGPath that is shaped like a Rounded Rectangle
    * ## Examples:
    * let cgPath = CGRectParser.roundRect(rect:.init(origin: .zero, size: .init(width:100,height:100)), radius: 20)
    * let shapeLayer:CAShapeLayer = .init()
    * CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
    * self.view.layer.addSublayer(shapeLayer)
    */
   public static func roundRect(rect: CGRect, radius: CGFloat) -> CGMutablePath {
      let path: CGMutablePath = .init()
      path.move(to: .init(x: rect.midX, y: rect.minY)) // was -> CGPathMoveToPoint
      path.addArc(tangent1End: .init(x: rect.maxX, y: rect.minY), tangent2End: .init(x: rect.maxX, y: rect.maxY), radius: radius) // Swift 3 upgrade, was-> CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius)
      path.addArc(tangent1End: .init(x: rect.maxX, y: rect.maxY), tangent2End: .init(x: rect.minX, y: rect.maxY), radius: radius)
      path.addArc(tangent1End: .init(x: rect.minX, y: rect.maxY), tangent2End: .init(x: rect.minX, y: rect.minY), radius: radius)
      path.addArc(tangent1End: .init(x: rect.minX, y: rect.minY), tangent2End: .init(x: rect.maxX, y: rect.minY), radius: radius)
      path.closeSubpath()
      return path
   }
   /**
    * Create a path using the coordinates of the rect passed in
    */
   public static func path(rect: CGRect) -> CGMutablePath {
      let path: CGMutablePath = .init()
      path.move(to: rect.origin) // was-> CGPathMoveToPoint
      path.addLine(to: .init(x: rect.origin.x + rect.size.width, y: rect.origin.y))// ***** Segment 1 *****
      path.addLine(to: .init(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height))// ***** Segment 2 *****
      path.addLine(to: .init(x: rect.origin.x, y: rect.origin.y + rect.size.height))// ***** Segment 3 *****
      path.closeSubpath() // ***** Segment 4 created by closing the path *****
      return path
   }
}
