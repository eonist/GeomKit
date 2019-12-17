import CoreGraphics
import QuartzCore

extension CALayer {
   /**
    * Removes sub layers
    * ## Examples:
    * self.removeSublayers()
    */
   public func removeSublayers() {
      self.sublayers?.forEach { $0.removeFromSuperlayer() }
   }
}
