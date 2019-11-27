import CoreGraphics

public class CGRectAsserter {
   public static func containsOrIntersectsLine(rect: CGRect, line: Line) -> Bool {
      return containsLine(rect: rect, line: line) || intersectsLine(rect: rect, line: line)
   }
   /**
    * Asserts if - Parameter: rectangle contains the line - Parameter: p1 to - Parameter: p2
    */
   public static func containsLine(rect: CGRect, line: Line) -> Bool {
      return rect.contains(line.p1) && rect.contains(line.p2)
   }
   /**
    * Asserts if - Parameter: rectangle intersects the line - Parameter: p1 to - Parameter: p2
    * - Note:  to assert if a line intersects or is contained within a rectangle use both of the methods in this class named intersectsLine and containsLine
    * - Note:  the for loop does not call RectangleParser.sides more than once
    * ## Examples: RectangleAsserter.intersectsLine(CGRect(200, 200, 500, 500),PrimitiveLine(CGPoint(0,0), CGPoint(60,60)));//false
    */
   public static func intersectsLine(rect: CGRect, line: Line) -> Bool {
      return CGRectParser.Side.sides(rect: rect).firstIndex { LineAsserter.intersects(a: $0, b: line) } != nil
   }
}
