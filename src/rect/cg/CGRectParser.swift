import Foundation
#if os(iOS)
import NumberSugariOS
#elseif os(macOS)
import NumberSugarMacOS
#endif
/**
 * - Note:  CGRectExtension also has alot of methods for parsing the CGRect
 */
public class CGRectParser {
   /**
    * Returns a Rectangle instance from any two points (does not have to be topLeft and bottomRight)
    */
   public static func rectangleByPoints(_ p1: CGPoint, p2: CGPoint) -> CGRect {
      let top: CGFloat = min(p1.y, p2.y)
      let left: CGFloat = min(p1.x, p2.x)
      let bottom: CGFloat = max(p1.y, p2.y)
      let right: CGFloat = max(p1.x, p2.x)
      let width: CGFloat = right - left
      let height: CGFloat = bottom - top
      return .init(x: left, y: top, width: width, height: height)
   }
   /**
    * - Note:  you can also use: someCGRect.center
    */
   public static func center(_ rectangle: CGRect) -> CGPoint {
      return .interpolate(rectangle.topLeft, rectangle.bottomRight, 0.5)
   }
   /**
    * Returns the midPoint of each side in - Parameter: rect
    */
   public static func sides(rect: CGRect) -> [CGPoint] { // <--Was previously named sidePoints
      return [rect.left, rect.right, rect.top, rect.bottom]
   }
   /**
    * Returns all the corners in - Parameter: rect
    */
   public static func corners(rect: CGRect) -> [CGPoint] {
      return [rect.topLeft, rect.topRight, rect.bottomLeft, rect.bottomRight]
   }
   /**
    * - Fixme: ⚠️️ maybe get the local rect with the pivot as center?? how does it work, hmmm
    */
   public static func localRectangle(topLeft: CGPoint, bottomRight: CGPoint, rotation: CGFloat) -> CGRect {
      let points: [CGPoint] = [topLeft, bottomRight]
      let rotatedPoints: [CGPoint] = CGPointTransformation.rotatePoints(points: points, pivot: .init(), rotation: -rotation)
      return rectangle(topLeft: rotatedPoints[0], bottomRight: rotatedPoints[1])
   }
   /**
    * - Fixme: Write doc
    */
   public static func rectangle(topLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
      let width: CGFloat = CGFloatParser.difference(topLeft.x, bottomRight.x)
      let height: CGFloat = CGFloatParser.difference(topLeft.y, bottomRight.y)
      return .init(origin: topLeft, size: .init(width, height))
   }
}
/**
 * Line
 */
extension CGRectParser { public class Side {} }
extension CGRectParser.Side {
   /**
    * Returns an array with Line instances of all sides of a rectangle
    */
   public static func sides(rect: CGRect) -> [CGLine] {
      return [topSide(rect: rect), rightSide(rect: rect), bottomSide(rect: rect), leftSide(rect: rect)]
   }
   public static func topSide(rect: CGRect) -> CGLine {
      return .init(p1: rect.topLeft, p2: .init(x: rect.right.x, y: rect.top.y))
   }
   public static func rightSide(rect: CGRect) -> CGLine {
      return .init(p1: .init(x: rect.right.x, y: rect.top.y), p2: rect.bottomRight)
   }
   public static func bottomSide(rect: CGRect) -> CGLine {
      return .init(p1: rect.bottomRight, p2: .init(x: rect.left.x, y: rect.bottom.y))
   }
   public static func leftSide(rect: CGRect) -> CGLine {
      return .init(p1: .init(rect.left.x, rect.bottom.y), p2: rect.topLeft)
   }
}
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
      path.move(to: .init(rect.midX, rect.minY)) // was -> CGPathMoveToPoint
      path.addArc(tangent1End: .init(rect.maxX, rect.minY), tangent2End: .init(rect.maxX, rect.maxY), radius: radius) // Swift 3 upgrade, was-> CGPathAddArcToPoint(path, nil, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius)
      path.addArc(tangent1End: .init(rect.maxX, rect.maxY), tangent2End: .init(rect.minX, rect.maxY), radius: radius)
      path.addArc(tangent1End: .init(rect.minX, rect.maxY), tangent2End: .init(rect.minX, rect.minY), radius: radius)
      path.addArc(tangent1End: .init(rect.minX, rect.minY), tangent2End: .init(rect.maxX, rect.minY), radius: radius)
      path.closeSubpath()
      return path
   }
   /**
    * Create a path using the coordinates of the rect passed in
    */
   public static func path(rect: CGRect) -> CGMutablePath {
      let path: CGMutablePath = .init()
      path.move(to: rect.origin) // was-> CGPathMoveToPoint
      path.addLine(to: .init(rect.origin.x + rect.size.width, rect.origin.y))// ***** Segment 1 *****
      path.addLine(to: .init(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height))// ***** Segment 2 *****
      path.addLine(to: .init(rect.origin.x, rect.origin.y + rect.size.height))// ***** Segment 3 *****
      path.closeSubpath() // ***** Segment 4 created by closing the path *****
      return path
   }
}

/**
 * - Fixme: ⚠️️ ⚠️️ create a similar method for localToGlobal
 * - Note:  This method used to be a modifying method but was remade as a parser, as its easier to use this way (make a duplocate method if mutating is need in the future)
 * ## Examples: var localRectangle: CGRect = CGRectParaser.globalToLocal(rectangle1.clone(), view)
 */
//    static func globalToLocal(_ globalRectangle: CGRect, localView: NSView) -> CGRect {
//        var globalRectangle = globalRectangle
//        var localRectangle: CGRect = CGRect(0, 0, globalRectangle.width, globalRectangle.height)
//        let globalToLocalPoint: CGPoint = localView.globalToLocal(globalRectangle.topLeft)
//        _ = localRectangle.offsetInPlace(globalToLocalPoint)
//        globalRectangle.x = localRectangle.x
//        globalRectangle.y = localRectangle.y
//        return globalRectangle
//    }
