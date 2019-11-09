import Foundation

public class CGRectModifier {
    /**
     * Positions a rectangle (top-left pivot)
     * - Note: modifies the original Rectangle instance, but is returned for chaining purposes
     * - Note: positions from the top left of the rectangle
     */
    public static func position(_ rectangle:inout CGRect, position: CGPoint) -> CGRect {
			let difference: CGPoint = CGPointParser.difference(p1: rectangle.topLeft, p2: position)
			_ = rectangle.offsetInPlace(difference)
			return rectangle
    }
    /**
     * Positions a rectangle (center pivot)
     * - Parameter: position this value is the new center-position
     * - Fixme: ⚠️️ ⚠️️ the difference could be calculated before-hand
     * - Note: the rectangle is returned because it may be convenient when you chain methods together
     */
    public static func centerPosition(_ rectangle:inout CGRect, position: CGPoint) -> CGRect {
			let difference: CGPoint = CGPointParser.difference(p1: rectangle.center, p2: position)
			_ = rectangle.offsetInPlace(difference)
			return rectangle
    }
}

