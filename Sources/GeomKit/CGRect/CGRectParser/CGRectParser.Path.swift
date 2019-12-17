import CoreGraphics
/**
 * Path
 */
extension CGRectParser { public class Path {} }
extension CGRectParser.Path {
   /**
    * Returns A CGPath that is shaped like a Rounded Rectangle
    * ## Examples:
    * let rect: CGRect = .init(origin: .zero, size: .init(width: 100, height: 100))
    * let cgPath = CGRectParser.roundRect(rect: rect, radius: 20)
    * let shapeLayer: CAShapeLayer = .init()
    * CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
    * self.view.layer.addSublayer(shapeLayer)
    */
   public static func roundRect(rect: CGRect, radius: CGFloat) -> CGMutablePath {
      let path: CGMutablePath = .init()
      path.move(to: .init(x: rect.midX, y: rect.minY))
      let pts: [(CGPoint, CGPoint)] = [
         (.init(x: rect.maxX, y: rect.minY), .init(x: rect.maxX, y: rect.maxY)),
         (.init(x: rect.maxX, y: rect.maxY), .init(x: rect.minX, y: rect.maxY)),
         (.init(x: rect.minX, y: rect.maxY), .init(x: rect.minX, y: rect.minY)),
         (.init(x: rect.minX, y: rect.minY), .init(x: rect.maxX, y: rect.minY))
      ]
      pts.forEach { path.addArc(tangent1End: $0.0, tangent2End: $0.1, radius: radius) }
      path.closeSubpath()
      return path
   }
   /**
    * Create a path using the coordinates of the rect passed in
    */
   public static func path(rect: CGRect) -> CGMutablePath {
      let path: CGMutablePath = .init()
      path.move(to: rect.origin)
      path.addLine(to: .init(x: rect.origin.x + rect.size.width, y: rect.origin.y))// Segment 1
      path.addLine(to: .init(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height))// Segment 2
      path.addLine(to: .init(x: rect.origin.x, y: rect.origin.y + rect.size.height))//Segment 3
      path.closeSubpath() // Segment 4 created by closing the path
      return path
   }
}
