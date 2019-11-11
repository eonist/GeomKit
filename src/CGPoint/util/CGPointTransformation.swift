import CoreGraphics

public class CGPointTransformation {
   /**
    * - Caution: ⚠️️ UNTESTED, but should work
    * Returns a point rotated around a pivot point
    * - Note: does not modifify the - Parameter: point
    * - Fixme: ⚠️️ rename to matrixRot?
    */
   public static func rotatePoint(point: CGPoint, pivot: CGPoint, rotation: CGFloat) -> CGPoint {
      var transform: CGAffineTransform = .identity
      transform.rotateAroundPoint(rotation: rotation, pivot: pivot)
      return point.applying(transform)
   }
   /**
    * Untested, but should work
    */
   public static func matrixRot(point: CGPoint, rotation: CGFloat) -> CGPoint {
      var transform: CGAffineTransform = .identity
      transform.rotate(rotation: rotation)
      return point.applying(transform)
   }
   /**
    * Returns points rotated around a pivot point
    * - Note: does not modifiy the original points
    * - Parameter: rotation: in radians (suppers radian values from -∞ to +∞)
    * - Fixme: ⚠️️ Make a similar method that takes initPoints and points, this way you avoid recrating a new array everytime
    */
   public static func rotatePoints(points: [CGPoint], pivot: CGPoint, rotation: CGFloat) -> [CGPoint] {
      var rotatedPoints: [CGPoint] = []
      var transform: CGAffineTransform = .identity
      transform.rotateAroundPoint(rotation: rotation, pivot: pivot)
      for point: CGPoint in points { rotatedPoints.append(point.applying(transform)) }
      return rotatedPoints
   }
   /**
    * Scales - Parameter: p at - Parameter: pivot with - Parameter: scale
    * ## Examples:
    * PointModifier.scale(CGPoint(0, 0), CGPoint(40,40), CGPoint(2, 2)) // Output: (-40.0, -40.0)
    * - Parameter: scale: 0 - 1
    */
   public static func scale(p: CGPoint, pivot: CGPoint, scale: CGPoint) -> CGPoint {
      var transform: CGAffineTransform = .identity
      transform.scaleFromPoint(scale: scale, pivot: pivot)
      return p.applying(transform)
   }
   /**
    * Scales an array of points from - Parameter: pivotPoint to - Parameter: xScale and - Parameter: yScale
    * - Note: Does not modify the original array
    * - Parameters:
    *   - points: reoresents the points to be scaled
    *   - pivot: represents the origin point where the - Parameter: points are scaled from
    *   - scale: represents the x and y axis scale ratio
    * ## Examples:
    * circle.setPosition(100,100)
    * var pivotPoint:Point = new Point(50,50)
    * var scaledPoints:Array = PointModifier.scalePoints([new Point(circle.x,circle.y)], pivotPoint,1, 1.5)
    * circle.setPosition(scaledPoints[0]);//Output: the circle is now at 100,125
    */
   public static func scalePoints(points: [CGPoint], pivot: CGPoint, scale: CGPoint) -> [CGPoint] {
      return points.map { CGPointTransformation.scale(p: $0, pivot: pivot, scale: scale) }
   }
}
