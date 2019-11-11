import Foundation
/**
 * Move the logic into CGRectModifier and CGRectParser and CGRectAsserter
 * For rect.isWithin(point) use: rect.contains(point)
 * - Note: Lots of Convenient CGRect methods here: https://github.com/nschum/SwiftCGRectExtensions/blob/master/CGRectExtensions/CGRectExtensions.swift
 */
extension CGRect {
   /**
    * Clones CGRect
    * ## Examples:  CGRect(0,0,100,100).clone()
    */
   public func clone() -> CGRect { // remove this, use copy instead
      return .init(origin: self.origin, size: self.size)
   }
   /**
    * Create a path using the coordinates of the rect passed in
    * ## Examples:  CGRect(0,0,100,100).path
    */
   public var path: CGMutablePath { return CGRectParser.path(rect: self) }
   public var corners: [CGPoint] { return CGRectParser.corners(rect: self) }
   public var sides: [CGPoint] { return CGRectParser.sides(rect: self) }
   /**
    * Expands the size of the rect from it's pivot
    */
   public func expand(dx: CGFloat, dy: CGFloat) -> CGRect {
      return CGRect(origin: .init(self.origin.x, self.origin.y), size: .init(self.width + dx, self.height + dy))
   }
}
// var nsRect: NSRect { return NSRectFromCGRect(self) }
/**
 * - Fixme: ⚠️️ Maybe for x,y,width,height aswell?
 * - Fixme: ⚠️️ Make it enum! it's faster
 */
//    subscript(key: Alignment) -> CGPoint {/*Easy Access to corners*/
//        get {
//            switch key{
//            case .topLeft: return topLeft
//            case .topRight: return topRight
//            case .bottomRight: return bottomRight
//            case .bottomLeft: return bottomLeft
//            case .topCenter: return top
//            case .bottomCenter: return bottom
//            case .centerLeft: return left
//            case .centerRight: return right
//            case .centerCenter: return center
//            }
//        }
//        set {
//            fatalError("UNSUPORTED CORNER TYPE: " + key.rawValue + " WITH VALUE: " + String(describing: newValue))
//        }
//    }
