import Foundation
#if os(iOS)
import NumberSugariOS
#elseif os(macOS)
import NumberSugarMacOS
#endif
/**
 * Convenient extensions
 */
extension CGSize {
   public init(_ width: CGFloat, _ height: CGFloat) { self.init(width: width, height: height) }
   public init(_ width: Double, _ height: Double) { self.init(width: width, height: height) }
   public init(_ width: Int, _ height: Int) { self.init(width: CGFloat(width), height: CGFloat(height)) }
   public var w: CGFloat { set { self.width = newValue } get { return self.width } }
   public var h: CGFloat { set { self.height = newValue } get { return self.height } }
   public func isNear(p: CGSize, epsilon: CGFloat) -> Bool { return CGPointAsserter.nearEquals(a: .init(self.w, self.h), b: .init(p.w, p.h), epsilon: epsilon) }
   /**
    * - Fixme: write example and doc
    */
   public func clip(_ min: CGSize, _ max: CGSize) -> CGSize {
      let w: CGFloat = self.width.clip(min.width, max.width)
      let h: CGFloat = self.height.clip(min.height, max.height)
      return .init(w, h)
   }
   public func interpolate(_ to: CGSize, _ scalar: CGFloat) -> CGSize { // Convenience
      return .init(self.w.interpolate(to.w, scalar), self.h.interpolate(to.h, scalar))
   }
}
/**
 * Extensions
 */
extension CGSize {
   public static func + (a: CGSize, b: CGSize) -> CGSize { return .init(a.width + b.width, a.height + b.height) }
   public static func - (a: CGSize, b: CGSize) -> CGSize { return .init(a.width - b.width, a.height - b.height) }
   public static func * (a: CGSize, b: CGSize) -> CGSize { return .init(a.w * b.w, a.h * b.h) }
   public static func += ( a: inout CGSize, b: CGSize) { a.width += b.width; a.height += b.height }/* Modifies a by adding b */
   public static func -= ( a: inout CGSize, b: CGSize) { a.width -= b.width; a.height -= b.height }/* Modifies a by subtracting b */
   public static func * (a: CGSize, b: CGFloat) -> CGSize { return .init(a.w * b, a.h * b) }
}

/**
 * ## Examples: CGSize(width:100,height:200)[.hor]//100
 */
//    subscript(dir: Dir) -> CGFloat {/*Convenience*/
//        get {
//            switch dir {
//            case .hor:
//                return self.width
//            case .ver:
//                return self.height
//            }
//        }set {
//            switch dir {
//            case .hor:
//                self.width = newValue
//            case .ver:
//                self.height = newValue
//            }
//        }
//    }
