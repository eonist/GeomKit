import CoreGraphics
/**
 * - Fixme: Maybe devide into CGPathParser.Rect CGPathParser.Ellipse CGPathParser.Circle etc. more seperation
 */
public class CGPathParser {
   // import AppKit /*Needed for the NSBezierPath type*/
   public typealias NSRectCorner = (topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat)
   /**
    * Returns a path with straight lines derived from an array of points (think follow the dots)
    * - Fixme: ⚠️️ ⚠️️ shouldn't this path be closed by a real close call?
    * - Note: effectivly it creates a PolyLine,
    * ## Examples:
    * let triangle = TriangleMath.equilateralTriangle(height: 100)
    * let points: [CGPoint] = [triangle.a, triangle.b, triangle.c]
    * let cgPath = CGPathParser.polyLine(points:points, close: true)
    * let shapeLayer: CAShapeLayer = .init()
    * CGPathModifier.fill(shape: shapeLayer, cgPath: cgPath, fillColor: .green)
    * self.view.layer.addSublayer(shapeLayer)
    */
   public static func polyLine(points: [CGPoint], close: Bool = false, offset: CGPoint = .init(x: 0, y: 0)) -> CGMutablePath {
      let path: CGMutablePath = .init()
      if !points.isEmpty { path.move(to: .init(x: points[0].x + offset.x, y: points[0].y + offset.y)) }
      for i in 1..<points.count {
         path.addLine(to: .init(x: points[i].x + offset.x, y: points[i].y + offset.y))
      }
      if close {
         path.addLine(to: .init(x: points[0].x + offset.x, y: points[0].y + offset.y)) // closes it self to the start position
         path.closeSubpath() // It may not be necessary to have the above line when you call this method
      }
      return path
   }
   /**
    * - Note: We do not need to close this path
    */
   public static func line(p1: CGPoint, p2: CGPoint) -> CGMutablePath {
      let linePath: CGMutablePath = .init()
      linePath.move(to: p1)
      linePath.addLine(to: p2)
      return linePath
   }
   /**
    * ## Examples: CGContextAddPath(context, CircleParser.circlePath(0,0,100))
    * - Parameters:
    *   - x: is the center x
    *   - y: is the center y
    * - Important: ⚠️️ circle is drawn from center position
    * - Note: you may add convenience methods for drawing circles from the topLeft position later
    */
   public static func circle(radius: CGFloat, cx: CGFloat = 0, cy: CGFloat = 0) -> CGMutablePath {
      let circlePath: CGMutablePath = .init()
      let circleCenter: CGPoint = .init(x: cx, y: cy)
      let circleRadius: CGFloat = radius
      let startingAngle: CGFloat = 0.0, endingAngle = CGFloat(2 * Double.pi)
      // Construct the circle path counterclockwise
      circlePath.addArc(center: circleCenter, radius: circleRadius, startAngle: startingAngle, endAngle: endingAngle, clockwise: false) // swift 3, CGPathAddArc
      circlePath.closeSubpath()
      return circlePath
   }
   /**
    * Returns a circle path from top left
    */
   public static func circ(radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0) -> CGMutablePath {
      let rect: CGRect = .init(origin: .init(x: x, y: y), size: .init(width: radius * 2, height: radius * 2))
      return ellipse(rect: rect)
   }
   /**
    * Returns a CGPath with data that represents a rect
    */
   public static func rect(rect: CGRect) -> CGMutablePath {
      let rectPath: CGMutablePath = .init()
      rectPath.addRect(rect) // Add the rectangle to the path
      return rectPath
   }
   /**
    * ## Examples: roundRect(5,100,100)
    * - - Fixme: ⚠️️ Draws a rounded rectangle using the size of individual x and y radii to draw the rounded corners.: drawRoundRectComplex2(x:Number, y:Number, width:Number, height:Number, radiusX:Number, radiusY:Number, topLeftRadiusX:Number, topLeftRadiusY:Number, topRightRadiusX:Number, topRightRadiusY:Number, bottomLeftRadiusX:Number, bottomLeftRadiusY:Number, bottomRightRadiusX:Number, bottomRightRadiusY:Number):void you have the code for this somewhere
    * - Note: was: //radius: CGFloat = 10, _ w: CGFloat = 100, _ hCGPathParser00, _ x: CGFloat = 0, _ y: CGFloat = 0
    * - Note: you can also useCGPathParsereWithRoundedRect() and CGPathAddRoundedRect()
    * - - Fixme: ⚠️️ use apples native roundedCorner class to represents the corner fillets, and pas cgrect, also add shouldclose flag
    */
   public static func roundedRect(rect: CGRect, radius: NSRectCorner) -> CGMutablePath {
      let path: CGMutablePath = .init()
      path.move(to: .init(x: rect.midX, y: rect.minY)) // swift 3 was -> CGPathMoveToPoint
      path.addArc(tangent1End: .init(x: rect.maxX, y: rect.minY), tangent2End: .init(x: rect.maxX, y: rect.maxY), radius: radius.topRight)// TR // swift 3 was CGPathAddArcToPoint
      path.addArc(tangent1End: .init(x: rect.maxX, y: rect.maxY), tangent2End: .init(x: rect.minX, y: rect.maxY), radius: radius.bottomRight)
      path.addArc(tangent1End: .init(x: rect.minX, y: rect.maxY), tangent2End: .init(x: rect.minX, y: rect.minY), radius: radius.bottomLeft)
      path.addArc(tangent1End: .init(x: rect.minX, y: rect.minY), tangent2End: .init(x: rect.maxX, y: rect.minY), radius: radius.topLeft)
      path.closeSubpath()
      return path
   }
}

//DEPRECATED:
// public static func lines(_ points: [CGPoint], _ close: Bool = false, _ offset: CGPoint = CGPoint(0, 0)) -> CGMutablePath { return polyLine(points: points,close: close,offset: offset) }//deprecated
/**
* Returns the boundingBox for the stroke in (the returned CGRect is in 0,0 space)
* - Fixme: ⚠️️ Move this method somewhere else?
*/
//    static func boundingBox(path: CGPath, lineStyle: LineStylable) -> CGRect{
//        let outlinePath:CGPath? = path.copy(strokingWithWidth:lineStyle.thickness, lineCap:lineStyle.lineCap, lineJoin:lineStyle.lineJoin, miterLimit:lineStyle.miterLimit)//swift 3 upgrade, used -> CGPathCreateCopyByStrokingPath
//        var boundingBox: CGRect = outlinePath!.boundingBoxOfPath/*there is also CGPathGetBoundingBox, which works a bit different, the difference is probably just support for cruves etc*/
//        if boundingBox.x.isInfinite {boundingBox = CGRect(path.currentPoint,boundingBox.size)}/*<--fix for paths that have zero width or height*/
//        return boundingBox
//    }
/**
* - Note: see CGPath().forEach or see examples for this on stackoverflow,
*/
//    static func nsBezierPath( path:CGPath) -> NSBezierPath? {
//        return nil
//    }
