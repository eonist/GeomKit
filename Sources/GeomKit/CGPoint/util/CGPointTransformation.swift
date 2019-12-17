import CoreGraphics

public class CGPointTransformation {
   /**
    * - Caution: ⚠️️ UNTESTED, but should work
    * - Returns a point rotated around a pivot point
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
    * - Parameter rotation: in radians (suppers radian values from -∞ to +∞)
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
    * CGPointTransformation.scale(p: CGPoint(x: 0, y: 0), pivot: CGPoint(x: 40, y: 40), scale: CGPoint(x: 2, y: 2)) // Output: (-40.0, -40.0)
    * - Parameter scale: 0 - 1
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
    * print(CGPointTransformation.scalePoints(points: [CGPoint(x: 100, y: 100)], pivot: CGPoint(x: 50,y: 50), scale: .init(x: 1, y: 1.5)).first) // CGPoint(x: 100, y: 125)
    */
   public static func scalePoints(points: [CGPoint], pivot: CGPoint, scale: CGPoint) -> [CGPoint] {
      return points.map { CGPointTransformation.scale(p: $0, pivot: pivot, scale: scale) }
   }
}
