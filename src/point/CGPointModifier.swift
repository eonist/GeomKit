import Foundation

class CGPointModifier {
    /**
     * Rotates a point around a given pivot point
     * - Parameter: point The point to rotate.
     * - Parameter: pivot the pivot point that - Parameter: point is roatated around.
     * - Parameter: rot the amount in which to rotate (radians)
     * - Note: this function does not alter the original point
     * - Note: this function is keept around to illustrate how to rotate a point around a pivot in regular trig math (Also may be faster than the equvilant function that uses matrix math)
     * - Fixme: ⚠️️ rename to trigRot?!?
     */
    static func rot(_ point: CGPoint, _ pivot: CGPoint, _ rot: CGFloat) -> CGPoint {
        let x: CGFloat = pivot.x + ( cos(rot) * (point.x - pivot.x) - sin(rot) * (point.y - pivot.y))
        let y: CGFloat = pivot.y + ( sin(rot) * (point.x - pivot.x) + cos(rot) * (point.y - pivot.y))
        return CGPoint(x,y)
    }
    /**
     * UNTESTED, but should work
     * Returns a point rotated around a pivot point
     * - Note: does not modifify the - Parameter: point
     * - Fixme: ⚠️️ rename to matrixRot?
     */
    static func rotatePoint(_ point: CGPoint, _ pivot: CGPoint, _ rotation: CGFloat) -> CGPoint {
        var transform = CGAffineTransform.identity
        transform.rotateAroundPoint(rotation, pivot)
        return point.applying(transform)
    }
    /**
     * Untested, but should work
     */
    static func matrixRot(_ point: CGPoint, _ rotation: CGFloat) -> CGPoint {
        var transform = CGAffineTransform.identity
        transform.rotate(rotation)//matrix.rotate(rotation);
        return point.applying(transform)//matrix.transformPoint(point);//swift 3 update
    }
    /**
     * Returns points rotated around a pivot point
     * - Note: does not modifiy the original points
     * - Parameter: rotation: in radians (suppers radian values from -∞ to +∞)
     * - Fixme: ⚠️️ ⚠️️make a similar method that takes initPoints and points, this way you avoid recrating a new array everytime
     */
    static func rotatePoints(_ points: [CGPoint], _ pivot: CGPoint, _ rotation: CGFloat) -> [CGPoint] {
        var rotatedPoints: [CGPoint] = []
        var transform = CGAffineTransform.identity
        transform.rotateAroundPoint(rotation, pivot) // was MatrixModifier.rotateAroundExternalPoint(matrix, pivot, rotation)
        for point: CGPoint in points { rotatedPoints.append(point.applying(transform))}
        return rotatedPoints
    }
    /**
     * Scales - Parameter: p at - Parameter: pivot with - Parameter: scale
     * ## Examples: PointModifier.scale(CGPoint(0, 0), CGPoint(40,40), CGPoint(2, 2)) // Output: (-40.0, -40.0)
     * - Parameter: scale: 0-1
     */
    static func scale(_ p: CGPoint, _ pivot: CGPoint, _ scale: CGPoint) -> CGPoint{
        var transform:CGAffineTransform = CGAffineTransform.identity
        transform.scaleFromPoint(scale: scale, pivot: pivot)
        return p.applying(transform)
    }
    /**
     * Scales an array of points from - Parameter: pivotPoint to - Parameter: xScale and - Parameter: yScale
     * - Note: Does not modify the original array
     * - Parameter: points reoresents the points to be scaled
     * - Parameter: pivot represents the origin point where the - Parameter: points are scaled from
     * - Parameter: scale represents the x and y axis scale ratio
     * ## Examples:
     * circle.setPosition(100,100)
     * var pivotPoint:Point = new Point(50,50)
     * var scaledPoints:Array = PointModifier.scalePoints([new Point(circle.x,circle.y)], pivotPoint,1, 1.5)
     * circle.setPosition(scaledPoints[0]);//Output: the circle is now at 100,125
     */
    static func scalePoints(_ points: [CGPoint], _ pivot: CGPoint, _ scale: CGPoint) -> [CGPoint]{
        return points.map { p in
            CGPointModifier.scale(p, pivot, scale)
        }
    }
    /**
     * Use this when you want to scale the points directly
     */
    static func scalePoints(_ points:inout [CGPoint], _ pivot: CGPoint, _ scale: CGPoint) {
        points.indices.forEach { i in
            points[i] = CGPointModifier.scale(points[i], pivot, scale)
        }
    }
    /**
     * Multiplies x and y in - Parameter: point with - Parameter: multiplier
     */
    static func multiply(_ point: CGPoint, _ multiplier: CGFloat) -> CGPoint {
        return CGPoint(point.x * multiplier,point.y * multiplier)
    }
}
