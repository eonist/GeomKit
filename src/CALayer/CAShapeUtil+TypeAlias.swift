import CoreGraphics
/**
 * Typealias
 * - Fixme: ⚠️️ Maybe make structs of the typealiases
 */
extension CGShapeUtil {
   public typealias Line = (p1: CGPoint, p2: CGPoint)
   public typealias LineStyle = (stroke: Color, thickness: CGFloat)
   public typealias Style = (fillColor: Color?, strokeColor: Color?, thickness: CGFloat?)
}
