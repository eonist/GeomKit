import Foundation
/**
 * Make an alias named Transform even?
 */
public typealias CGTransform = CGAffineTransform // Convenience
extension CGAffineTransform {
    public mutating func rotate(_ rotation: CGFloat) { // Convenience
        self = self.rotated(by: rotation) // was-> CGAffineTransformRotate
    }
    public mutating func scale(_ xScale: CGFloat, _ yScale: CGFloat) { // Convenience
        self = self.scaledBy(x: xScale, y: yScale) // CGAffineTransformScale
    }
    public mutating func translate(_ x: CGFloat, _ y: CGFloat) { // Convenience
        self = self.translatedBy(x: x, y: y) // -> CGAffineTransformTranslate
    }
    public mutating func rotateAroundPoint(_ rotation: CGFloat, _ pivot: CGPoint) { // Convenience
        self = .rotateAroundPoint(self, rotation, pivot)
    }
    /**
     * - Parameters:
     *   - scale: CGPoint values from 0-1
     *   - pivot: The CGPoint to scale from
     */
    public mutating func scaleFromPoint(scale: CGPoint, pivot: CGPoint) { // Convenience
        self = .scaleFromPoint(self, scale.x, scale.y, pivot)
    }
    /**
     * Scales a matrix and returns the result. The skewSide parameter lets the user determine which side to skew (right or bottom).
     */
    public mutating func skew(_ transform: CGAffineTransform, angle: CGFloat, skewSide: String = "right") {
        // see old code for this implementation
    }
    public static func rotateAroundPoint(_ transform: CGTransform, _ rotation: CGFloat, _ pivot: CGPoint) -> CGTransform {
		return CGAffineTransformParser.rotateAroundPoint(transform: transform, rotation: rotation, pivot: pivot)
    }
    public static func scaleFromPoint(_ transform: CGTransform, _ xScale: CGFloat, _ yScale: CGFloat, _ pivot: CGPoint) -> CGTransform {
      return CGAffineTransformParser.scaleFromPoint(transform: transform, scale: .init(x: xScale, y: yScale), pivot: pivot)
    }
    public static func translate(_ transform: CGTransform, _ x: CGFloat, _ y: CGFloat) -> CGAffineTransform{
		return CGAffineTransformParser.translate(transform: transform, x: x, y: y)
    }
    public static func transformAroundPoint(_ transform: CGTransform, _ scale: CGPoint, _ rotation: CGFloat, _ offset: CGPoint, _ pivot: CGPoint) -> CGTransform {
		return CGAffineTransformParser.transformAroundPoint(transform: transform, scale: scale, rotation: rotation, offset: offset, pivot: pivot)
    }
    public static func transformWithPivot(_ transform:inout CGTransform, _ scale: CGPoint, _ rotation: CGFloat, _ offset: CGPoint, _ pivot: CGPoint, _ initRotation: CGFloat = 0) {
        _ = CGAffineTransformModifier.transformWithPivot(&transform,scale,rotation,offset,pivot,initRotation)
    }
    public static func copy(_ transform: CGTransform) -> CGTransform {
		return CGAffineTransformParser.copy(transform: transform)
    }
    public mutating func concat(_ transformation: CGTransform) {
		self = CGAffineTransformParser.concat(a: self, b: transformation)
    }
    public static func concat(_ a: CGTransform, _ b: CGTransform) -> CGTransform{
		return CGAffineTransformParser.concat(a: a, b: b)
    }
    public func copy() -> CGTransform{
		return CGAffineTransformParser.copy(transform: self)
    }
    public func transformPoint(_ point: CGPoint) -> CGPoint{
        return CGAffineTransformModifier.transformPoint(point, self)
    }
    public var id: String { return a.string + "," + b.string + "," + c.string + "," + d.string + "," + tx.string + "," + ty.string }//a,b,c,d,tx,ty /*Reflection uses this variable*/
    /**
     * Simpler init
     * - Caution: This is not the same as .identity
     */
    public init(_ a: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat, _ tx: CGFloat, _ ty: CGFloat) {/*0.0 - 1.0*/
        self.init(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }
}
