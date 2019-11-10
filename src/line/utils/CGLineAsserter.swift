import Foundation
/*
 * - Fixme: ⚠️️ There is about 20 other lineAssert methods in legacy code
 */
public class CGLineAsserter {
    public static func intersects(a: CGLine, b: CGLine) -> Bool { // - Fixme: ⚠️️ rename to isSomeName
      return CGPointAsserter.intersects(a1: a.p1, a2: a.p2, b1: b.p1, b2: b.p2)
    }
}
