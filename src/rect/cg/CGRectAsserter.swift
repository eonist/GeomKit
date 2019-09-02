import Foundation

class CGRectAsserter {
    static func containsOrIntersectsLine(_ rectangle: CGRect, line: CGLine) -> Bool {
        return containsLine(rectangle, line: line) || intersectsLine(rectangle, line: line)
    }
    /**
     * Asserts if - Parameter: rectangle contains the line - Parameter: p1 to - Parameter: p2
     */
    static func containsLine(_ rectangle: CGRect, line: CGLine) -> Bool {
        return rectangle.contains(line.p1) && rectangle.contains(line.p2)
    }
    /**
     * Asserts if - Parameter: rectangle intersects the line - Parameter: p1 to - Parameter: p2
     * - Note:  to assert if a line intersects or is contained within a rectangle use both of the methods in this class named intersectsLine and containsLine
     * - Note:  the for loop does not call RectangleParser.sides more than once
     * ## Examples: RectangleAsserter.intersectsLine(CGRect(200,200,500,500),PrimitiveLine(CGPoint(0,0), CGPoint(60,60)));//false
     */
    static func intersectsLine(_ rectangle: CGRect, line: CGLine) -> Bool {
        return CGRectParser.sides(rectangle).index(where: { LineAsserter.intersects($0, line) }) != nil
    }
}
