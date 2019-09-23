import Foundation
/*
 * - Fixme: ⚠️️ There is about 20 other lineAssert methods in legacy code
 */
public class CGLineAsserter {
    public static func intersects(_ a: CGLine, _ b: CGLine) -> Bool {// :- Fixme: ⚠️️ ⚠️️ rename to isSomeName
        return CGPointAsserter.intersects(a.p1, a.p2, b.p1, b.p2)
    }
}
