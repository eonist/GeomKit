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
   public var w: CGFloat { set { self.width = newValue } get { return self.width } }
   public var h: CGFloat { set { self.height = newValue } get { return self.height } }
   public func isNear(p: CGSize, epsilon: CGFloat) -> Bool { return CGPointAsserter.nearEquals(a: .init(x: self.w, y: self.h), b: .init(x: p.w, y: p.h), epsilon: epsilon) }
   /**
    * - Fixme: write example and doc
    */
   public func clip(_ min: CGSize, _ max: CGSize) -> CGSize {
      let w: CGFloat = self.width.clip(min.width, max.width)
      let h: CGFloat = self.height.clip(min.height, max.height)
      return .init(width: w, height: h)
   }
   public func interpolate(_ to: CGSize, _ scalar: CGFloat) -> CGSize {
      return .init(width: self.w.interpolate(to.w, scalar), height: self.h.interpolate(to.h, scalar))
   }
}
/**
 * Extensions
 */
extension CGSize {
   public static func + (a: CGSize, b: CGSize) -> CGSize { return .init(width: a.width + b.width, height: a.height + b.height) }
   public static func - (a: CGSize, b: CGSize) -> CGSize { return .init(width: a.width - b.width, height: a.height - b.height) }
   public static func * (a: CGSize, b: CGSize) -> CGSize { return .init(width: a.w * b.w, height: a.h * b.h) }
   /**
    * Modifies a by adding b
    */
   public static func += ( a: inout CGSize, b: CGSize) { a.width += b.width; a.height += b.height }
   /**
    * Modifies a by subtracting b
    */
   public static func -= ( a: inout CGSize, b: CGSize) { a.width -= b.width; a.height -= b.height }
   public static func * (a: CGSize, b: CGFloat) -> CGSize { return .init(width: a.w * b, height: a.h * b) }
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
