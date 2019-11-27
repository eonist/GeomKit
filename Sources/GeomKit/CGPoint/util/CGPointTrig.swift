import QuartzCore
import NumberSugar

public class CGPointTrig {
   /**
    * Returns a point in a polar cordinate system by - Parameter: len and - Parameter: angle (in a safe way)
    * - Parameter: angle must be between -PI and PI use:  Angle.normalized2(angle)
    * - Fixme: ⚠️️ compact this method
    * - Fixme: ⚠️️ why is this safe and regular polar isn't?
    * - Fixme: ⚠️️ use switch
    */
   public static func safePolar(len: CGFloat, angle: CGFloat) -> CGPoint {
      if angle == 0 {
         return .init(x: len, y: 0)
      } else if angle == π || angle == -π {
         return .init(x: -len, y: 0)
      } else if angle == -π / 2 {
         return .init(x: 0, y: -len)
      } else if angle == π / 2 {
         return .init(x: 0, y: len)
      } else {
         return .init(x: cos(angle) * len, y: sin(angle) * len)
      }
   }
   /**
    * Returns a point, in a polar cordinate system (from 0,0), for - Parameter: angle and - Parameter: length
    * Return: a point on a circle where the pivot is TopLeft Corner (0,0)
    * - Parameters:
    *   - radius: the radius of the circle
    *   - angle: the angle where the point is (in radians) (-π to π) (3.14.. to 3.14..)
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
    * - Parameter slope: (the rate of change between x and y) use PointParser.slope(p1,p2) to find the slope
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
    * - Parameters:
    *   - slope: (the rate of change between x and y) use PointParser.slope(p1,p2) to find the slope
    *   - p1: the first Point that makes up the line that makes up the slope
    *   - x2: the x marks the spot. X is the final x in the point on the slope.
    * ## Examples:
    * PointParser.y(CGPoint(100,100), 200, 1);//Output: 200
    */
   public static func y(p1: CGPoint, x2: CGFloat, slope: CGFloat) -> CGFloat {
      return (slope * (x2 - p1.x)) + p1.y
   }
}
