import Foundation

class LineParser {
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
   public static func intersection(a: Line, b: Line) -> CGPoint {
      let (x1, y1, x4, y4) = (a.p1.x, a.p1.y, b.p2.x, b.p2.y)
      let (dx1, dx2) = (a.p2.x - x1, b.p1.x - x4)
      var p: CGPoint = .init()
      if dx1 == 0 || dx2 == 0 { // - Fixme: ⚠️️ not 0 or what?
         p.x = 0
         p.y = 0
      }
      let m1: CGFloat = (a.p2.y - y1) / dx1
      let m2: CGFloat = (b.p1.y - y4) / dx2
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
    * - Fixme: Needs doc and example
    */
   public static func intersection2(a: Line, b: Line) -> CGPoint? {
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
   public static func normalizedIntersection(a: Line, b: Line) -> CGPoint {
      if a.p1.equals(b.p1) || a.p1.equals(b.p2) { return a.p1 }
      else if a.p2.equals(b.p1) || a.p2.equals(b.p2) { return a.p2 }
      else if LineAsserter.collinear(p1: a.p1, p2: a.p2, p3: b.p1) { return b.p1 }
      else if LineAsserter.collinear(p1: a.p1, p2: a.p2, p3: b.p2) { return b.p2 }
      else if LineAsserter.collinear(p1: b.p1, p2: b.p2, p3: a.p1) { return a.p1 }
      else if LineAsserter.collinear(p1: b.p1, p2: b.p2, p3: a.p2) { return a.p2 }
      else { return CGPointParser.intersection(p1: a.p1, p2: a.p2, p3: b.p1, p4: b.p2) }
   }
}

