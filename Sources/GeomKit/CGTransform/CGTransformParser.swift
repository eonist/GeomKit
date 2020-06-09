import CoreGraphics

typealias CGTransformParser = CGAffineTransformParser // Simplifies the name

public class CGAffineTransformParser {
   /**
    * Convenience, See MatrixModifier.transformWithPivot for more detail
    */
   public static func transformWithPivot(transform: CGTransform, scale: CGPoint, rotation: CGFloat, offset: CGPoint, pivot: CGPoint, initRotation: CGFloat = 0) -> CGTransform {
      var transform = transform
      return CGTransformModifier.transformWithPivot(transform: &transform, scale: scale, rotation: rotation, offset: offset, pivot: pivot)
   }
   /**
    * Returns a matrix that you can get an objects position clockwise from the pivot, can also futher be manipulated if the input matrix has variables.
    * - Note: The equivelent code in Matrix Trasform form: // let transform: CGAffineTransform = CGAffineTransformMake(cos(a),sin(a),-sin(a),cos(a),x - x * cos(a)+y * sin(a),y - x * sin(a) - y * cos(a))
    * - Fixme: ⚠️️ We could return the matrix for method chaining
    * - Fixme: ⚠️️ Rename to just rotate? for simplicity?
    */
   public static func rotateAroundPoint(transform: CGTransform, rotation: CGFloat, pivot: CGPoint) -> CGTransform {
      var transform = transform
      transform.translate(x: pivot.x, y: pivot.y) // this looks strage, but you sort of set the point here
      transform.rotate(rotation: rotation) // = CGAffineTransformRotate(transform, rotation);
      transform.translate(x: -pivot.x, y: -pivot.y) // Then you reset the offset to the original position
      return transform
   }
   /**
    * - Note: You can chain scaleFromPoint and rotatAroundPoint and eventually skewFromPoint. This is a great way to get different transform results quickly
    * - Important: ⚠️️ You scale a view from the center. So if you want to scale from TopLeft, you have to calcualte the pivot from the centers POV. So: CGPoint(x:-width/2,y:-height/2)
    * ## Examples:
    * tagView.transform = CGAffineTransformParser.scaleFromPoint(transform: tagView.transform, scale: .init(x:0.5,y:0.5), pivot: .init(x:0,y:-(100+arrowHeight)/2))
    * - Parameters:
    *   - transform: The current transform applied to the view
    *   - scale: CGPoint values from 0-1
    *   - pivot: The CGPoint to scale from
    */
   public static func scaleFromPoint(transform: CGAffineTransform, scale: CGPoint, pivot: CGPoint) -> CGAffineTransform {
      var transform = transform
      transform = transform.translatedBy(x: pivot.x, y: pivot.y) // this looks strange, but you sort of set the point here
      transform = transform.scaledBy(x: scale.x, y: scale.y) // CGAffineTransformRotate(transform, rotation);
      transform = transform.translatedBy(x: -pivot.x, y: -pivot.y) // then you reset the offset to the original position
      return transform
   }
   /**
    * Translate
    */
   public static func translate(transform: CGTransform, x: CGFloat, y: CGFloat) -> CGTransform {
      var transform = transform
      transform.translate(x: x, y: y)
      return transform
   }
   /**
    * - Note: this method is used in conjunction with the radial gradient matrix transformation of context
    * - Note: the special thing about it is that the scale value follows the axis of the rotation. defualt rotation is 0 and thus scale.y becomes the width sort of
    */
   public static func transformAroundPoint(transform: CGTransform, scale: CGPoint, rotation: CGFloat, offset: CGPoint, pivot: CGPoint) -> CGTransform {
      var transform = transform
      transform = .translate(transform: transform, x: offset.x, y: offset.y) // transform,minRadius * gradient.relativeStartCenter!.x, minRadius*gradient.relativeStartCenter!.y
      transform = .rotateAroundPoint(transform: transform, rotation: rotation, pivot: pivot)
      transform = .scaleFromPoint(transform: transform, xScale: scale.y, yScale: scale.x, pivot: pivot)
      return transform
   }
   /**
    * Rename to clone?
    */
   public static func copy(transform: CGTransform) -> CGTransform {
      .init(a: transform.a, b: transform.b, c: transform.c, d: transform.d, tx: transform.tx, ty: transform.ty)//radialGradient.gradientTransform
   }
   /**
    * Updated in swift 4.2
    */
   public static func concat(a: CGTransform, b: CGTransform) -> CGTransform {
      a.concatenating(b)
   }
}
