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
    public static func interpolate(_ a: CGPoint, _ b: CGPoint, _ scalar: CGFloat) -> CGPoint {
        return CGPoint(a.x.interpolate(b.x, scalar), a.y.interpolate(b.y, scalar))
    }
    /**
     * Returns a point in a polar cordinate system by - Parameter: len and - Parameter: angle (in a safe way)
     * - Parameter: angle must be between -PI and PI use:  Angle.normalized2(angle)
     * - Fixme: ⚠️️⚠️️ compact this method
     * - Fixme: ⚠️️⚠️️ why is this safe and regular polar isn't?
     * - Fixme: ⚠️️⚠️️ use switch
     */
    public static func safePolar(_ len: CGFloat, _ angle: CGFloat) -> CGPoint {
        if angle == 0 {
				return .init(len, 0)
        } else if angle == π || angle == -π {
				return .init(-len, 0)
        } else if angle == -π / 2 {
				return .init(0, -len)
        } else if angle == π / 2 {
				return .init(0,len)
        } else {
				return .init(cos(angle) * len, sin(angle) * len)
        }
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
     * Returns a point, in a polar cordinate system (from 0,0), for - Parameter: angle and - Parameter: length
     * Return: a point on a circle where the pivot is TopLeft Corner (0,0)
     * - Parameter: radius: the radius of the circle
     * - Parameter: angle: the angle where the point is (in radians) (-π to π) (3.14.. to 3.14..)
     * - Note: formula "<angle*cos*radius,angle*sin*radius>"
     * - Note: One can also use Point.polar(radius,radian) or equivilent method in the spesific language
     * Base formula CosΘ = x/len
     * Base Formula SinΘ = y/len
     * ## Examples:  CGPoint.polarPoint(100, π/4)//polarPoint:  (70.7106781186548, 70.7106781186547) bottomRight corner
     * - Note: π = Double.pi
     */
    public static func polar(radius: CGFloat, angle: CGFloat) -> CGPoint {
        let x: CGFloat = radius * cos(angle)
        let y: CGFloat = radius * sin(angle)
		return .init(x: x, y: y)
    }
    /**
     * Returns the slope of two points (the rate of change)
     * FORMULA: "y2-y1/x2-x1"
     * - Note: you can also find slope by this: Math.tan(Trig.angle(p1,p2))
     * - Note: if slope returns infinity that means its straight down
     * - Note: if slope returns -infinity that means its straight up
     * - Note: if the slope returns 0 that means its straight forward or straight back, this makes it hard to destinguish between forward and backward slope unless you flip the x and y for both values incases where all y values are equal
     * - Note: if the slope returns NaN that means p1 equals p2
     * Positive line increases from left to right
     * Negative line decreases from right to left
     * Zero line is horizontal
     * Undefined line is vertical
     */
    public static func slope(a: CGPoint, b: CGPoint) -> CGFloat {
        let aa: CGFloat = b.y - a.y
        let bb: CGFloat = b.x - a.x
        return aa / bb
    }
    /**
     * Returns the x position when a line passes through - Parameter: p1 and - Parameter: y2 and that line has a slope-value of - Parameter: slope
     * - Parameter: slope (the rate of change between x and y) use PointParser.slope(p1,p2) to find the slope
     * - Note: based on the equation: "slope = (y2-y1)/(x2-x1)"
     * - Note: the Angle.y() is a similar method but it uses the angle to find the x
     * - Note: this method is great if you have 2 points and you want to find the third but you only know the y value of that point
     * ## Examples:
     * PointParser.x(CGPoint(100,100), 200, 1);//Output: 200
     */
    public static func x(p1: CGPoint, y2: CGFloat, slope: CGFloat) -> CGFloat {
        return ((y2 - p1.y) / slope) + p1.x
    }
    /**
     * Returns the y position when a line passes through - Parameter: p1 and - Parameter: y2 and that line has a slope-value of - Parameter: slope
     * - Note: based on the equation: "slope = (y2-y1)/(x2-x1)"
     * - Note: the Angle.x() is a similar method but it uses the angle to find the x
     * - Note: this method is great if you have 2 points and you want to find the third but you only know the x value of that point
     * - Parameter: slope (the rate of change between x and y) use PointParser.slope(p1,p2) to find the slope
     * - Parameter: p1: the first Point that makes up the line that makes up the slope
     * - Parameter: x2: the x marks the spot. X is the final x in the point on the slope.
     * ## Examples:
     * PointParser.y(CGPoint(100,100), 200, 1);//Output: 200
     */
    public static func y(p1: CGPoint, x2: CGFloat, slope: CGFloat) -> CGFloat {
        return (slope * (x2 - p1.x)) + p1.y
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
        return CGPoint(x, y)
    }

    /**
     * Returns the distance between points in both the x and y axis. (unlike Point.distance which returns the diagonal distance between two points)
     * - Note: think of this method as a way of finding the horizontal and vertical distance between two points
     * - Fixme: ⚠️️potentially make polarAxisDistance which would potentially support any angled axis
     */
    public static func axisDistance(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPoint(CGFloatParser.distance(p1.x, p2.x), CGFloatParser.distance(p1.y, p2.y))
    }
    /**
     * Returns a CGRect that makes derived from - Parameter: points (think bounding box of points)
     */
    public static func rectangle(points: [CGPoint]) -> CGRect{
		var max: CGPoint = points.count > 0 ? (points[0] as CGPoint).copy() : .init()
		var min: CGPoint = points.count > 0 ? (points[0] as CGPoint).copy() : .init()
        points.forEach { point in
            if point.x > max.x { max.x = point.x }
            else if point.x < min.x { min = CGPoint(point.x, min.y) }
            if point.y > max.y { max.y = point.y}
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
        return CGRect(topLeft.x, topLeft.y, width, height)
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
     * - Note: can also use Point.interpolate(p1,p2,0.5)
     * - Fixme: ⚠️️ can you write an example just with substraction, this might be usefull and more optimized
     * ## Examples:  (how to do it with substraction and addition)
     * var minX:Number = Math.min(p1.x,p2.x);
     * var minY:Number = Math.min(p1.y,p2.y);
     * var maxX:Number = Math.max(p1.x,p2.x);
     * var maxY:Number = Math.max(p1.y,p2.y);
     * var center: CGPoint = CGPoint(minX+((maxX-minX)/2),(minY+((maxY-minY)/2)));
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
    public static func midPoint(_ p1: CGPoint, _ p2: CGPoint) -> CGPoint {
		return .init((p1.x + p2.x) / 2, (p1.y + p2.y) / 2)
    }
    /**
     * Returns a Point half way between a and b
     */
    public static func midPt(a: CGPoint, b: CGPoint) -> CGPoint {
         let minX: CGFloat =  min(a.x, b.x)
         let minY: CGFloat =  min(a.y, b.y)
         let maxX: CGFloat =  max(a.x, b.x)
         let maxY: CGFloat =  max(a.y, b.y)
         let x: CGFloat = minX + ((maxX - minX) / 2)
         let y: CGFloat = minY + ((maxY - minY) / 2)
         return .init(x: x, y: y)
    }
//    static func midPt(){ }
    /**
     * Returns a new point comprised of the addition of two points
     */
    public static func add(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
		return .init(a.x + b.x, a.y + b.y)
    }
    /**
     * Returns a new point comprised of the subtraction of two points
     */
    public static func substract(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
        return .init(a.x - b.x, a.y - b.y)
    }
    /**
     * Returns a new point comprised of the division of two points
     */
    public static func divide(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
        return .init(a.x / b.x, a.y / b.y)
    }
    /**
     * Returns the multiplication of two points
     * ## Examples:  PointParser.multiply(CGPoint(20,20), CGPoint(2,2))//Output: (40,40)
     */
    public static func multiply(_ a: CGPoint, _ b: CGPoint) -> CGPoint {
        return .init(a.x * b.x, a.y * b.y)
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
     * - Fixme: ⚠️️ thouroughly test this function before deployment, what happens with parralell lines for instance?
     * - Fixme: ⚠️️ comment this method
     * - Fixme: ⚠️️ do reasearch into vectors, slope and the intersection of vectrors
     * - Fixme: ⚠️️ this actually gave a bad result
     * - Fixme: ⚠️️ if the end of line a is equal to the end of line b then it returns a faulty result (x=0, y=NaN)
     * - Fixme: ⚠️️ doesnt handle parallel cases very well (x=0, y=NaN), do you mean paralellel or colinear?
     * - Fixme: ⚠️️ if you deal with finding the intersection on a case that makes a cross, then you can probably do a faster intersection that is also more correct, if y = y and x = x and y is within the length of b, and x is within the length of b then the intersection must be a.y and b.x etc
     */
    public static func intersection(_ p1: CGPoint, _ p2: CGPoint, _ p3: CGPoint, _ p4: CGPoint) -> CGPoint {
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
     * New
     */
    public static func intersection2(a: (p1: CGPoint, p2: CGPoint), b: (p1: CGPoint, p2: CGPoint)) -> CGPoint? {
      let distance: CGFloat = (a.p2.x - a.p1.x) * (b.p2.y - b.p1.y) - (a.p2.y - a.p1.y) * (b.p2.x - b.p1.x)
      if distance == 0 { return nil } // error, parallel lines
      let u: CGFloat = ((b.p1.x - a.p1.x) * (b.p2.y - b.p1.y) - (b.p1.y - a.p1.y) * (b.p2.x - b.p1.x)) / distance
      let v: CGFloat = ((b.p1.x - a.p1.x) * (a.p2.y - a.p1.y) - (b.p1.y - a.p1.y) * (a.p2.x - a.p1.x)) / distance
      if (u < 0.0 || u > 1.0) { return nil } // error, intersection not inside a
      if (v < 0.0 || v > 1.0) { return nil } // error, intersection not inside b
      return .init(x: a.p1.x + u * (a.p2.x - a.p1.x), y: a.p1.y + u * (a.p2.y - a.p1.y))
   }
    /**
     * beta
     * - Note: sometimes when 2 lines touch at the begining or ends they dont yeild the correct intersection
     * - Note: when line a touches the line part of line b, not line b end or beginning then 3 points are collinear and the line a point that is collinear with line b is returned
     * - Note: the lines cant be colinear or equal
     */
    public static func normalizedIntersection(_ aP1: CGPoint, _ aP2: CGPoint, _ bP1: CGPoint, _ bP2: CGPoint) -> CGPoint {
        if aP1.equals(bP1) || aP1.equals(bP2){ return aP1}
        else if aP2.equals(bP1) || aP2.equals(bP2) { return aP2 }
        else if CGPointAsserter.collinear(aP1, aP2, bP1) { return bP1 }
        else if CGPointAsserter.collinear(aP1, aP2, bP2) { return bP2 }
        else if CGPointAsserter.collinear(bP1, bP2, aP1) { return aP1 }
        else if CGPointAsserter.collinear(bP1, bP2, aP2) { return aP2 }
        else { return CGPointParser.intersection(aP1, aP2, bP1, bP2) }
    }
}
