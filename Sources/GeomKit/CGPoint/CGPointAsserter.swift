import QuartzCore
import NumberSugar
/**
 * CGPoint assertion
 */
public class CGPointAsserter {
   /**
    * Asserts if p1 is less than p2 (but eigther x OR y can be equal to the other x or y)
    * - Note: think - Parameter: p1 is eigther to the left of - Parameter: p2 or above - Parameter: p2
    * - Note: but both x and y can't be the same in both points
    */
   public static func less(p1: CGPoint, p2: CGPoint) -> Bool {
      return (p1.x <= p2.x && p1.y < p2.y) || (p1.x < p2.x && p1.y <= p2.y)
   }
   /**
    * Asserts if p1 is more than p2  (but eigther x OR y can be equal to the other x or y)
    * - Note: think - Parameter: p1 is to the right of - Parameter: p2 or bellow - Parameter: p2
    * - Note: but both x and y cant be the same in both points
    */
   public static func more(p1: CGPoint, p2: CGPoint) -> Bool {
      return (p1.x >= p2.x && p1.y > p2.y) || (p1.x > p2.x && p1.y >= p2.y)
   }
   /**
    * Asserts if p1 is less than p2
    * - Note: think - Parameter: p1 is eigther to the left of - Parameter: p2 AND above - Parameter: p2
    */
   public static func absolutLess(p1: CGPoint, p2: CGPoint) -> Bool { // - Fixme: ⚠️️ absolutleyLess?!?
      return p1.x < p2.x && p1.y < p2.y
   }
   /**
    * Asserts if p1 is more than p2
    * - Note: think - Parameter: p1 is to the right of - Parameter: p2 AND bellow - Parameter: p2
    */
   public static func absolutMore(p1: CGPoint, p2: CGPoint) -> Bool { // - Fixme: ⚠️️ rename to absolutleyMore?!?
      return p1.x > p2.x && p1.y > p2.y
   }
   /**
    * Asserts if p1 is less or equal to p2
    * - Note: think - Parameter: p1 is eaual or above - Parameter: p2
    * - Note: both x and y can be the same in both points
    */
   public static func lessOrEqual(p1: CGPoint, p2: CGPoint) -> Bool {
      return p1.x <= p2.x && p1.y <= p2.y
   }
   /**
    * Asserts if p1 is more or equal to p2
    * - Note: think - Parameter: p1 is eaual or bellow - Parameter: p2
    * - Note: both x and y can be the same in both points
    */
   public static func moreOrEqual(p1: CGPoint, p2: CGPoint) -> Bool {
      return p1.x >= p2.x && p1.y >= p2.y
   }
   /**
    * Asserts if p1 is in the same position as p2
    * - Note: You can also use the native function point1.equales(point2)
    * - Note: unlike the native point.equals method this method supports NaN values
    * - Fixme: ⚠️️ does NaN equal NaN and what is its native behaviour
    */
   public static func equals(p1: CGPoint, _ p2: CGPoint) -> Bool {
      return CGFloatAsserter.equals(p1.x, p2.x) && CGFloatAsserter.equals(p1.y, p2.y)
   }
   /**
    * - Fixme: ⚠️️ rename to isNearlyEqual, or isNearEqual
    */
   public static func nearEquals(a: CGPoint, b: CGPoint, epsilon: CGFloat) -> Bool {
      return CGFloatAsserter.isNear(a.x, b.x, epsilon) && CGFloatAsserter.isNear(a.y, b.y, epsilon)
   }
}
/**
 * - Fixme: ⚠️️ ⚠️️ When needed add these:
 * oppositeDirectional
 * isContraDirectional
 * isNearContraDir
 * parallel
 * coDirectional
 * isCoDirectional
 * isNearCoDir
 * perpendicular
 * intersects
 * within
 * absoluteWithin
 * absolutleyWithin
 * nearAbsolutleyWithin
 * collinear
 * nearEquals
 */
