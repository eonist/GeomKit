import CoreGraphics
/**
 * - Note: Used to be named: PrimitiveLine
 * - Fixme: ⚠️️ rename to CGLine (Occupying the name Line for something so simple isn't necessary)
 * - Fixme: rename to GeomLine? CG implies native class
 */
public struct Line {
    public var p1: CGPoint
    public var p2: CGPoint
    public init(p1: CGPoint, p2: CGPoint) {
        self.p1 = p1
        self.p2 = p2
    }
}
