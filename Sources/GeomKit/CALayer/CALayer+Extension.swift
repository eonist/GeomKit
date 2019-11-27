import CoreGraphics
import QuartzCore

extension CALayer {
   /**
    * Removes sub layers
    */
   public func removeSublayers() {
      self.sublayers?.forEach { $0.removeFromSuperlayer() }
   }
}
