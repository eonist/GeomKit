import Foundation
#if os(iOS)
import NumberSugariOS
#elseif os(macOS)
import NumberSugarMacOS
#endif

public class CGPointParser {
   /**
    * Returns a point between - Parameter: p1 and - Parameter: p2 multiplied by the - Parameter: scalar
    * - Parameter: scalar: the scalar is between 0 and 1
    * - Note: PointParser.interpolate() is different form the Adobe flash native Point.interpolate, the later multiplies from p2 to p1, the former multiplies form p1 tp p2 which i think is more logical
    * - Fixme: ⚠️️ Using Math.abs could be more optimized? this optimization needs research. check the proto site
    */
   public static func interpolate(a: CGPoint, b: CGPoint, scalar: CGFloat) -> CGPoint {
      return .init(x: a.x.interpolate(b.x, scalar), y: a.y.interpolate(b.y, scalar))
   }
   /**
    * Returns the distance between two points
    * - Note: Math formula for distance of two points is: AB2 = dx2 + dy2 (distance = sqrt(dx2 + dy2)) where one side is dx - the difference in x-coordinates, and the other is dy - the difference in y-coordinates.
    * - Note: Math formula: c^2=a^2+b^2 (||u|| = √h^2+v^2) (in triangle notation c= hypotenus etc)
    * - Note: there is also : let distance = hypot(p1.x - p2.x, p1.y - p2.y)
    */
   public static func distance(a: CGPoint, b: CGPoint) -> CGFloat {
      let xDifference: CGFloat = CGFloatParser.relativeDifference(a.x, b.x)
      let yDifference: CGFloat = CGFloatParser.relativeDifference(a.y, b.y)
      return sqrt(pow(xDifference, 2) + pow(yDifference, 2))
   }
   /**
    * A method to check distance between two points
    * - Note: reference https://en.wikipedia.org/wiki/Pythagorean_theorem
    */
   public static func dist(a: CGPoint, b: CGPoint) -> CGFloat {
      let xDist = a.x - b.x
      let yDist = a.y - b.y
      return sqrt(xDist * xDist + yDist * yDist)
   }
   /**
    * Returns the difference between two points
    * - Note: Great when finding polar points when the pivot isnt at point 0,0
    * ## Examples:
    * print(new Point(20,20),new Point(-40,-40))//Output: (-60,-60)
    * print(new Point(20,20),new Point(40,-40))//Output: (20,-60)
    * print(difference(new Point(2,2), new Point(4,4)))//Outputs: (2,2)
    * print(difference(new Point(2,2), new Point(-4,-4)))//Outputs: (-6,-6)
    * print(difference(new Point(-2,-2), new Point(-4,-4)))//Outputs: (-2,-2)
    * print(difference(new Point(-2,-2), new Point(4,4)))//Outputs: (6,6)
    * - Fixme: ⚠️️ is there a math formula ? write the formula you have atleast
    */
   public static func difference(p1: CGPoint, p2: CGPoint) -> CGPoint {
      let x: CGFloat = p2.x - p1.x
      let y: CGFloat = p2.y - p1.y
      return .init(x: x, y: y)
   }
   /**
    * - Fixme: add doc
    */
   public static func relativeDifference(a: CGPoint, b: CGPoint) -> CGPoint {
      let x: CGFloat = CGFloatParser.relativeDifference(a.x, b.x)
      let y: CGFloat = CGFloatParser.relativeDifference(a.y, b.y)
      return .init(x: x, y: y)
   }
   /**
    * Returns the distance between points in both the x and y axis. (unlike Point.distance which returns the diagonal distance between two points)
    * - Note: think of this method as a way of finding the horizontal and vertical distance between two points
    * - Fixme: ⚠️️potentially make polarAxisDistance which would potentially support any angled axis
    */
   public static func axisDistance(p1: CGPoint, p2: CGPoint) -> CGPoint {
      return .init(x: CGFloatParser.distance(p1.x, p2.x), y: CGFloatParser.distance(p1.y, p2.y))
   }
   /**
    * Returns a CGRect that makes derived from - Parameter: points (think bounding box of points)
    * - Fixme: Use reduce or map instead of forEach
    */
   public static func rectangle(pts: [CGPoint]) -> CGRect {
      var max: CGPoint = !pts.isEmpty ? (pts[0] as CGPoint).clone() : .init()
      var min: CGPoint = !pts.isEmpty ? (pts[0] as CGPoint).clone() : .init()
      pts.forEach { point in
         if point.x > max.x { max.x = point.x }
         else if point.x < min.x { min = .init(x: point.x, y: min.y) }
         if point.y > max.y { max.y = point.y }
         else if point.y < min.y { min.y = point.y }
      }
      return cornersToRectangle(topLeft: min, bottomRight: max)
   }
   /**
    * Returns an rectangle from a topLeft and bottomRight corners
    * - Note: getting the points from an rectangle: _transformBox.boundingBox.getRect(_transformBox) output: (x=0, y=0, w=400, h=400)
    */
   public static func cornersToRectangle(topLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
      let width: CGFloat = CGFloatParser.distance(topLeft.x, bottomRight.x)
      let height: CGFloat = CGFloatParser.distance(topLeft.y, bottomRight.y)
      return .init(x: topLeft.x, y: topLeft.y, width: width, height: height)
   }
   /**
    * Returns the avarage point in an array of point
    * - Note: Centeroid definition: the center of mass of a geometric object of uniform
    * - Note: Median definition: the midpoint of a frequency distribution of observed values or quantities
    * - Note: could also be named avg for average
    * - Fixme: ⚠️️ rename to average?
    * - Fixme: ⚠️️ add support for ...args see dataprovider for example, this may slow down this function which needs to be fast,maybe make a fastMedian suppliment function then?
    */
   public static func median(pts: [CGPoint]) -> CGPoint {
      let median: CGPoint = pts.reduce(.zero) { .init(x: $0.x + $1.x, y: $0.y + $1.y) }
      return .init(x: median.x / CGFloat(pts.count), y: median.y / CGFloat(pts.count))
   }
   /**
    * Returns a Point half way between - Parameter: p1 and p2
    * - Note: Can also use Point.interpolate(p1, p2, 0.5)
    * - Fixme: ⚠️️ Can you write an example just with substraction, this might be usefull and more optimized
    * ## Examples:  (How to do it with substraction and addition)
    * var minX:Number = Math.min(p1.x, p2.x)
    * var minY:Number = Math.min(p1.y, p2.y)
    * var maxX:Number = Math.max(p1.x, p2.x)
    * var maxY:Number = Math.max(p1.y, p2.y)
    * var center: CGPoint = CGPoint(minX + ((maxX - minX) / 2), (minY + ((maxY - minY) / 2)))
    */
   public static func center(p1: CGPoint, p2: CGPoint) -> CGPoint {
      return .interpolate(p1, p2, 0.5)
   }
   /**
    * Returns a Point half way between - Parameter: p1 and - Parameter: p2
    * - Note: formula: "(x1+x2)/2 , (y1,y2)/2"
    * - Note: probably faster than using interpolation
    * ## Examples:  midPoint(CGPoint(0,0),CGPoint(100,100))//CGPoint(50,50)
    * Caution: this only works if p1 is .zero
    */
   public static func midPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
      return .init(x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2)
   }
   /**
    * Returns a Point half way between a and b
    */
   public static func midPt(a: CGPoint, b: CGPoint) -> CGPoint {
      let minX: CGFloat = min(a.x, b.x)
      let minY: CGFloat = min(a.y, b.y)
      let maxX: CGFloat = max(a.x, b.x)
      let maxY: CGFloat = max(a.y, b.y)
      let x: CGFloat = minX + ((maxX - minX) / 2)
      let y: CGFloat = minY + ((maxY - minY) / 2)
      return .init(x: x, y: y)
   }
}
