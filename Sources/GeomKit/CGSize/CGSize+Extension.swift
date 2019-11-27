import CoreGraphics
import NumberSugar
/**
 * Convenient extensions
 */
extension CGSize {
   /**
    * isNear
    */
   public func isNear(p: CGSize, epsilon: CGFloat) -> Bool { return CGPointAsserter.nearEquals(a: .init(x: self.width, y: self.height), b: .init(x: p.width, y: p.height), epsilon: epsilon) }
   /**
    * clip
    * - Fixme: ⚠️️ write example and doc
    */
   public func clip(_ min: CGSize, _ max: CGSize) -> CGSize {
      let w: CGFloat = self.width.clip(min.width, max.width)
      let h: CGFloat = self.height.clip(min.height, max.height)
      return .init(width: w, height: h)
   }
   /**
    * interpolate
    */
   public func interpolate(_ to: CGSize, _ scalar: CGFloat) -> CGSize {
      return .init(width: self.width.interpolate(to.width, scalar), height: self.height.interpolate(to.height, scalar))
   }
}
/**
 * Extensions
 */
extension CGSize {
   public static func + (a: CGSize, b: CGSize) -> CGSize { return .init(width: a.width + b.width, height: a.height + b.height) }
   public static func - (a: CGSize, b: CGSize) -> CGSize { return .init(width: a.width - b.width, height: a.height - b.height) }
   public static func * (a: CGSize, b: CGSize) -> CGSize { return .init(width: a.width * b.width, height: a.height * b.height) }
   /**
    * Modifies a by adding b
    */
   public static func += ( a: inout CGSize, b: CGSize) { a.width += b.width; a.height += b.height }
   /**
    * Modifies a by subtracting b
    */
   public static func -= ( a: inout CGSize, b: CGSize) { a.width -= b.width; a.height -= b.height }
   public static func * (a: CGSize, b: CGFloat) -> CGSize { return .init(width: a.width * b, height: a.height * b) }
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
