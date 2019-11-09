import Foundation

/**
 * - Note: Used to be named: PrimitiveLine
 * - Fixme: ⚠️️ rename to CGLine (Occupying the name Line for something so simple isn't necessary)
 * - Fixme: rename to GeomLine? CG implies native class
 */
public struct CGLine {
    var p1: CGPoint
    var p2: CGPoint
    init(_ p1: CGPoint, _ p2: CGPoint) {
        self.p1 = p1
        self.p2 = p2
    }
}
