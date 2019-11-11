import Foundation
/**
 * - Fixme: Make an alias named Transform?
 */
public typealias CGTransform = CGAffineTransform
extension CGAffineTransform {
   /**
    * Rotate
    */
   public mutating func rotate(rotation: CGFloat) {
      self = self.rotated(by: rotation) // was-> CGAffineTransformRotate
   }
   /**
    * Scale
    */
   public mutating func scale(xScale: CGFloat, yScale: CGFloat) {
      self = self.scaledBy(x: xScale, y: yScale) // CGAffineTransformScale
   }
   /**
    * Translate
    */
   public mutating func translate(x: CGFloat, _ y: CGFloat) {
      self = self.translatedBy(x: x, y: y) // -> CGAffineTransformTranslate
   }
   /**
    * RotateAroundPoint
    */
   public mutating func rotateAroundPoint(rotation: CGFloat, pivot: CGPoint) {
      self = .rotateAroundPoint(transform: self, rotation: rotation, pivot: pivot)
   }
   /**
    * - Parameters:
    *   - scale: CGPoint values from 0-1
    *   - pivot: The CGPoint to scale from
    */
   public mutating func scaleFromPoint(scale: CGPoint, pivot: CGPoint) {
      self = .scaleFromPoint(transform: self, xScale: scale.x, yScale: scale.y, pivot: pivot)
   }
   /**
    * Scales a matrix and returns the result. The skewSide parameter lets the user determine which side to skew (right or bottom).
    */
   public mutating func skew(transform: CGAffineTransform, angle: CGFloat, skewSide: String = "right") {
      // see old code for this implementation
   }
   public static func rotateAroundPoint(transform: CGTransform, rotation: CGFloat, pivot: CGPoint) -> CGTransform {
      return CGAffineTransformParser.rotateAroundPoint(transform: transform, rotation: rotation, pivot: pivot)
   }
   public static func scaleFromPoint(transform: CGTransform, xScale: CGFloat, yScale: CGFloat, pivot: CGPoint) -> CGTransform {
      return CGAffineTransformParser.scaleFromPoint(transform: transform, scale: .init(x: xScale, y: yScale), pivot: pivot)
   }
   public static func translate(transform: CGTransform, x: CGFloat, y: CGFloat) -> CGAffineTransform {
      return CGAffineTransformParser.translate(transform: transform, x: x, y: y)
   }
   public static func transformAroundPoint(transform: CGTransform, scale: CGPoint, rotation: CGFloat, offset: CGPoint, pivot: CGPoint) -> CGTransform {
      return CGAffineTransformParser.transformAroundPoint(transform: transform, scale: scale, rotation: rotation, offset: offset, pivot: pivot)
   }
   public static func transformWithPivot(transform:inout CGTransform, scale: CGPoint, rotation: CGFloat, offset: CGPoint, pivot: CGPoint, initRotation: CGFloat = 0) {
      _ = CGAffineTransformModifier.transformWithPivot(&transform, scale, rotation, offset, pivot, initRotation)
   }
   public static func copy(transform: CGTransform) -> CGTransform {
      return CGAffineTransformParser.copy(transform: transform)
   }
   public mutating func concat(transformation: CGTransform) {
      self = CGAffineTransformParser.concat(a: self, b: transformation)
   }
   public static func concat(a: CGTransform, b: CGTransform) -> CGTransform {
      return CGAffineTransformParser.concat(a: a, b: b)
   }
   public func copy() -> CGTransform {
      return CGAffineTransformParser.copy(transform: self)
   }
   public func transformPoint(point: CGPoint) -> CGPoint {
      return CGAffineTransformModifier.transformPoint(point, self)
   }
   /**
    * ## Examples:
    * a,b,c,d,tx,ty Reflection uses this variable
    */
   public var id: String {
      return a.string + "," + b.string + "," + c.string + "," + d.string + "," + tx.string + "," + ty.string
   }
}

/**
 * Simpler init
 * - Caution: This is not the same as .identity
 */
//   public init(a: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat, tx: CGFloat, ty: CGFloat) {
//      self.init(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
//   }
