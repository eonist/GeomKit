import CoreGraphics
public typealias MatrixModifier = CGAffineTransformModifier // Convenience
public class CGAffineTransformModifier {
   /**
    * - Note: The result may vary if you change the order of how the translations are applied. This method does not work if you need to rotate and scale around a point for instance, then you need to change the order
    * - Note: It's prefreable to chain the methods bellow. so if yoou need other variations of this method. You may want to just chain some transform calls instead
    * - Note: the matrix is returned for variable chaining convenince
    */
   public static func transformWithPivot(transform:inout CGTransform, scale: CGPoint, rotation: CGFloat, offset: CGPoint, pivot: CGPoint, initRotation: CGFloat = 0) -> CGTransform {
      transform = transform.translatedBy(x: pivot.x, y: pivot.y) // this looks strage, but you sort of set the point here
      if initRotation != 0 { transform.rotate(rotation: -initRotation) }
      transform.scale(xScale: scale.x, yScale: scale.y)
      transform.rotate(rotation: rotation)
      transform.translate(x: -pivot.x + offset.x, y: -pivot.y + offset.y) // globalToLocal
      return transform
   }
   /**
    * Applys a AffineTransformation on a point (This method is mostly for convenience)
    */
   public static func transformPoint(point: CGPoint, transform: CGTransform) -> CGPoint {
      return point.applying(transform)
   }
}
