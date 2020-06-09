import CoreGraphics

public class CGRectAsserter {
   /**
    * Add doc
    */
   public static func containsOrIntersectsLine(rect: CGRect, line: Line) -> Bool {
      containsLine(rect: rect, line: line) || intersectsLine(rect: rect, line: line)
   }
   /**
    * Asserts if - Parameter: rectangle contains the line - Parameter: p1 to - Parameter: p2
    */
   public static func containsLine(rect: CGRect, line: Line) -> Bool {
      rect.contains(line.p1) && rect.contains(line.p2)
   }
   /**
    * Asserts if - Parameter: rectangle intersects the line - Parameter: p1 to - Parameter: p2
    * - Note:  to assert if a line intersects or is contained within a rectangle use both of the methods in this class named intersectsLine and containsLine
    * - Note:  the for loop does not call RectangleParser.sides more than once
    * ## Examples:
    * CGRectAsserter.intersectsLine(rect: .init(x: 200, y: 200, width: 500, height: 500), (p1: CGPoint(x: 0, y: 0), p2: CGPoint(x: 60, y: 60))) // false
    */
   public static func intersectsLine(rect: CGRect, line: Line) -> Bool {
      CGRectParser.Side.sides(rect: rect).contains { LineAsserter.intersects(a: $0, b: line) }
   }
}
