import CoreGraphics
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
   public static func rectangleByPoints(p1: CGPoint, p2: CGPoint) -> CGRect {
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
   public static func center(rect: CGRect) -> CGPoint {
      return .interpolate(a: rect.topLeft, b: rect.bottomRight, scalar: 0.5)
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
   public static func localRectangle(tl: CGPoint, br: CGPoint, rot: CGFloat) -> CGRect {
      let points: [CGPoint] = [tl, br]
      let rotatedPoints: [CGPoint] = CGPointTransformation.rotatePoints(points: points, pivot: .init(), rotation: -rot)
      return rectangle(tl: rotatedPoints[0], br: rotatedPoints[1])
   }
   /**
    * - Fixme: Write doc
    */
   public static func rectangle(tl: CGPoint, br: CGPoint) -> CGRect {
      let width: CGFloat = CGFloatParser.difference(tl.x, br.x)
      let height: CGFloat = CGFloatParser.difference(tl.y, br.y)
      return .init(origin: tl, size: .init(width: width, height: height))
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
