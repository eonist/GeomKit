import Cocoa

class CGRectModifier {
    /**
     * - Note:  modifies the original Rectangle instance, but is returned for chaining purposes
     * - Note:  positions from the top left of the rectangle
     */
    static func position(_ rectangle:inout CGRect, position: CGPoint) -> CGRect {
        let difference: CGPoint = CGPointParser.difference(rectangle.topLeft,position)
        _ = rectangle.offsetInPlace(difference)
        return rectangle
    }
    /**
     * - Parameter: position this value is the new center-position
     * - Fixme: ⚠️️ ⚠️️ the difference could be calculated before-hand
     * - Note:  the rectangle is returned because it may be convenient when you chain methods together
     */
    static func centerPosition(_ rectangle:inout CGRect, position: CGPoint) -> CGRect {
        let difference: CGPoint = CGPointParser.difference(rectangle.center, position)
        _ = rectangle.offsetInPlace(difference)
        return rectangle
    }
}
