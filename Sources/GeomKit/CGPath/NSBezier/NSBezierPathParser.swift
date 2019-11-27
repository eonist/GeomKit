#if os(macOS)
import Cocoa
/**
 * - Note: This class only works in mac
 * - Fixme: ⚠️️mark this only for macos
 */
public class NSBezierPathParser {
   /**
    * untested
    */
   public static func cgPath(nsBezierPath: NSBezierPath) -> CGPath? {
      if nsBezierPath.elementCount == 0 { return nil }
      let path = CGMutablePath()
      var didClosePath = false
      for i in 0...nsBezierPath.elementCount - 1 { // - Fixme: ⚠️ why isn't this: 0..<.elementCount?
         var points = [NSPoint](repeating: .zero, count: 3)
         switch nsBezierPath.element(at: i, associatedPoints: &points) {
         case .moveTo: path.move(to: points[0]) // swift 3 updated
         case .lineTo: path.addLine(to: points[0])
         case .curveTo: path.addCurve(to: points[2], control1: points[0], control2: points[1])
         case .closePath: path.closeSubpath(); didClosePath = true
         @unknown default: fatalError("unknown case")
         }
      }
      if !didClosePath { path.closeSubpath() }
      return path.copy()
   }
}
#endif
