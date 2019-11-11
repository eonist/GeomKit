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
      return .init(a.x.interpolate(b.x, scalar), a.y.interpolate(b.y, scalar))
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
      return .init(x, y)
   }
   /**
    * - Fixme: add doc
    */
   public static func relativeDifference(a: CGPoint, b: CGPoint) -> CGPoint {
      let x: CGFloat = CGFloatParser.relativeDifference(a.x, b.x)
      let y: CGFloat = CGFloatParser.relativeDifference(a.y, b.y)
      return .init(x, y)
   }
   /**
    * Returns the distance between points in both the x and y axis. (unlike Point.distance which returns the diagonal distance between two points)
    * - Note: think of this method as a way of finding the horizontal and vertical distance between two points
    * - Fixme: ⚠️️potentially make polarAxisDistance which would potentially support any angled axis
    */
   public static func axisDistance(p1: CGPoint, p2: CGPoint) -> CGPoint {
      return .init(CGFloatParser.distance(p1.x, p2.x), CGFloatParser.distance(p1.y, p2.y))
   }
   /**
    * Returns a CGRect that makes derived from - Parameter: points (think bounding box of points)
    * - Fixme: Use reduce or map instead of forEach
    */
   public static func rectangle(pts: [CGPoint]) -> CGRect {
      var max: CGPoint = !pts.isEmpty ? (pts[0] as CGPoint).copy() : .init()
      var min: CGPoint = !pts.isEmpty ? (pts[0] as CGPoint).copy() : .init()
      pts.forEach { point in
         if point.x > max.x { max.x = point.x }
         else if point.x < min.x { min = .init(point.x, min.y) }
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
      return .init(topLeft.x, topLeft.y, width, height)
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
      return .init((p1.x + p2.x) / 2, (p1.y + p2.y) / 2)
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
   /**
    * Returns the point of intersection between two lines
    * - Parameter: p1, p2 (Point) line 1 point struct
    * - Parameter: p3, p4 (Point) line 2 point struct
    * - Note: you can use Trigonometry to accomplish this see the Traingle classes, its basically when you have 2 angles and 1 side, since you have 2 angles you have the third aswell, then you can use sin and cos to find the point
    * - Note: if eigther p1 or p2 is CoLinear and within with p3 and p4 then it will yield an intersection
    * - Note: if line a touches the start or end of line b then it intersects
    * - Note: if 2 lines are colinear this method will return (x=0, y=NaN) or (x=NaN, y=0) or (x=NaN, y=NaN) same if the lines are equal
    * - Note: you can also use convergingPoint in TriangleMath instead of intersection
    * - Fixme: ⚠️️ Thouroughly test this function before deployment, what happens with parralell lines for instance?
    * - Fixme: ⚠️️ Comment this method
    * - Fixme: ⚠️️ Do reasearch into vectors, slope and the intersection of vectrors
    * - Fixme: ⚠️️ This actually gave a bad result
    * - Fixme: ⚠️️ If the end of line a is equal to the end of line b then it returns a faulty result (x=0, y=NaN)
    * - Fixme: ⚠️️ Doesn't handle parallel cases very well (x=0, y=NaN), do you mean paralellel or colinear?
    * - Fixme: ⚠️️ If you deal with finding the intersection on a case that makes a cross, then you can probably do a faster intersection that is also more correct, if y = y and x = x and y is within the length of b, and x is within the length of b then the intersection must be a.y and b.x etc
    */
   public static func intersection(p1: CGPoint, p2: CGPoint, p3: CGPoint, p4: CGPoint) -> CGPoint {
      let (x1, y1, x4, y4) = (p1.x, p1.y, p4.x, p4.y)
      let (dx1, dx2) = (p2.x - x1, p3.x - x4)
      var p: CGPoint = .init()
      if dx1 == 0 || dx2 == 0 { // - Fixme: ⚠️️ not 0 or what?
         p.x = 0
         p.y = 0
      }
      let m1: CGFloat = (p2.y - y1) / dx1
      let m2: CGFloat = (p3.y - y4) / dx2
      if dx1 == 0 { // - Fixme: ⚠️️ not 0 or what?
         p.x = x1
         p.y = m2 * (x1 - x4) + y4
         return p
      } else if dx2 == 0 { // - Fixme: ⚠️️ not 0 or what?
         p.x = x4
         p.y = m1 * (x4 - x1) + y1
         return p
      }
      p.x = (-m2 * x4 + y4 + m1 * x1 - y1) / (m1 - m2)
      p.y = m1 * (p.x - x1) + y1
      return p
   }
   /**
    * - Fixme: needs doc and example
    */
   public static func intersection2(a: (p1: CGPoint, p2: CGPoint), b: (p1: CGPoint, p2: CGPoint)) -> CGPoint? {
      let distance: CGFloat = (a.p2.x - a.p1.x) * (b.p2.y - b.p1.y) - (a.p2.y - a.p1.y) * (b.p2.x - b.p1.x)
      if distance == 0 { return nil } // Error, parallel lines
      let u: CGFloat = ((b.p1.x - a.p1.x) * (b.p2.y - b.p1.y) - (b.p1.y - a.p1.y) * (b.p2.x - b.p1.x)) / distance
      let v: CGFloat = ((b.p1.x - a.p1.x) * (a.p2.y - a.p1.y) - (b.p1.y - a.p1.y) * (a.p2.x - a.p1.x)) / distance
      if u < 0.0 || u > 1.0 { return nil } // Error, intersection not inside a
      if v < 0.0 || v > 1.0 { return nil } // Error, intersection not inside b
      return .init(x: a.p1.x + u * (a.p2.x - a.p1.x), y: a.p1.y + u * (a.p2.y - a.p1.y))
   }
   /**
    * Beta
    * - Note: Sometimes when 2 lines touch at the begining or ends they don't yeild the correct intersection
    * - Note: When line a touches the line part of line b, not line b end or beginning then 3 points are collinear and the line a point that is collinear with line b is returned
    * - Note: The lines can't be colinear or equal
    */
   public static func normalizedIntersection(aP1: CGPoint, aP2: CGPoint, bP1: CGPoint, bP2: CGPoint) -> CGPoint {
      if aP1.equals(bP1) || aP1.equals(bP2) { return aP1 }
      else if aP2.equals(bP1) || aP2.equals(bP2) { return aP2 }
      else if LineAsserter.collinear(p1: aP1, p2: aP2, p3: bP1) { return bP1 }
      else if LineAsserter.collinear(p1: aP1, p2: aP2, p3: bP2) { return bP2 }
      else if LineAsserter.collinear(p1: bP1, p2: bP2, p3: aP1) { return aP1 }
      else if LineAsserter.collinear(p1: bP1, p2: bP2, p3: aP2) { return aP2 }
      else { return CGPointParser.intersection(p1: aP1, p2: aP2, p3: bP1, p4: bP2) }
   }
}
