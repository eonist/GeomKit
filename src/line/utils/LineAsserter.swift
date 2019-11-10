import Foundation
#if os(iOS)
import NumberSugariOS
#elseif os(macOS)
import NumberSugarMacOS
#endif
/*
 * - Fixme: ⚠️️ There is about 20 other lineAssert methods in legacy code
 */
public class LineAsserter {
   /**
    * - Fixme: Write doc
    */
   public static func intersects(a: Line, b: Line) -> Bool { // - Fixme: ⚠️️ rename to isSomeName
      intersects(a1: a.p1, a2: a.p2, b1: b.p1, b2: b.p2)
   }
   /**
    * - Note: Converging is when a trajectory hits the the infinite head of the other point
    * - Note: converging is when the head of each trajectory converge
    * - Fixme: ⚠️️ write the math formula for this method and explaine more verbosly
    */
   public static func converging(p1: CGPoint, p2: CGPoint, angle1: CGFloat, angle2: CGFloat) -> Bool {
      let p1A = CGPoint.polarPoint(radius: 100, angle: angle1).add(p1)
      let p1B = CGPoint.polarPoint(radius: 100, angle: angle1 - π).add(p1)
      let p2A = CGPoint.polarPoint(radius: 100, angle: angle2).add(p2)
      let p2B = CGPoint.polarPoint(radius: 100, angle: angle2 - π).add(p2)
      let len = CGPoint.distance(a: p1A, b: p2A)
      return len < CGPoint.distance(a: p1B, b: p2A) && len < CGPoint.distance(a: p2A, b: p2B)
   }
   /**
    * - Note: doing !convering is not the same as the bellow, because !convering could mean isParallel
    * - Fixme: ⚠️️ diverging is when the tail of both trajectories converge, then shouldnt it be possible to test for the converging of said tails with the converging method, it should
    * - Fixme: ⚠️️ oppositeDirection is when a trajectory hits the infinite tail of the other point,hmm im not so sure
    * - Fixme: ⚠️️ collinearNormal is when both trajectories point onto each other
    * - Fixme: ⚠️️ you need a term when 2 vectors are collinear but point in opposite direction, contraDirectional is the Antonym of coDirectional which is when 2 lines are paralell and pointing in the same direction
    */
   public static func diverging(p1: CGPoint, p2: CGPoint, angle1: CGFloat, angle2: CGFloat) -> Bool {
      let p1A = CGPoint.polarPoint(radius: 100, angle: angle1).add(p1)
      let p1B = CGPoint.polarPoint(radius: 100, angle: angle1 - π).add(p1)
      let p2A = CGPoint.polarPoint(radius: 100, angle: angle2).add(p2)
      let p2B = CGPoint.polarPoint(radius: 100, angle: angle2 - π).add(p2)
      let len: CGFloat = CGPoint.distance(a: p1A, b: p2A)
      return len > CGPoint.distance(a: p1B, b: p2A) && len > CGPoint.distance(a: p2A, b: p2B)
   }
   /**
    * Asserts if two lines intersects (p1 and p2 is line1, p3 and p4 is line2)
    * - Note: if eigther a1 or a2 is "CoLinear" and within with b1 and b2 then it intersects, does it, yes?
    * - Note: if line a touches the start or end of line b then it intersects
    * - Note: if the end of line a is equal to the end of line b then it returns false, this can in some cases be undesirable - Fixme: ⚠️️ you could add a point check to mitigate this problem
    * - Fixme: ⚠️️ group a in tuple and b in tuple
    */
   public static func intersects(a1: CGPoint, a2: CGPoint, b1: CGPoint, b2: CGPoint) -> Bool {
      var q: CGFloat = (a1.y - b1.y) * (b2.x - b1.x) - (a1.x - b1.x) * (b2.y - b1.y)
      let d: CGFloat = (a2.x - a1.x) * (b2.y - b1.y) - (a2.y - a1.y) * (b2.x - b1.x)
      if d == 0 { return false }
      let r: CGFloat = q / d
      q = (a1.y - b1.y) * (a2.x - a1.x) - (a1.x - b1.x) * (a2.y - a1.y)
      let s: CGFloat = q / d
      if  r < 0 || r > 1 || s < 0 || s > 1 { return false }
      return true
   }
   /**
    * Asserts if p1, p2 and p3 are all colinear
    * - Note: Three or more points are said to be collinear if they all lay on a line (co-linear or contra-linear)
    * - Note: Another way to think of this is that despite there being more than two points, the affine space that they span is only one dimensional.
    * - Note: Collinearity of 3 points could be asserter if the area of the triangle that make up the 3 points is 0
    * - Note: if two of the points are equals, then this method may not work, better assert for equals before utilizing this method
    * - Fixme: ⚠️️ if two points are equal then the three are colliinear actually
    */
   public static func collinear(p1: CGPoint, p2: CGPoint, p3: CGPoint) -> Bool { // - Fixme: ⚠️️ rename to is..., depricate and link, or not?!?!
      let a: CGFloat = CGPointParser.slope(a: p2, b: p3)
      let b: CGFloat = CGPointParser.slope(a: p2, b: p1)
      let c: CGFloat = CGPointParser.slope(a: p3, b: p1)
      return (a == b && b == c) || (CGFloatAsserter.isInfinity(a) && CGFloatAsserter.isInfinity(b) && CGFloatAsserter.isInfinity(c))//why do we assert infinity again?
   }
}
