import CoreGraphics

extension CALayer {
   /**
    * Removes sub layers
    */
   public func removeSublayers() {
      self.sublayers?.forEach { $0.removeFromSuperlayer() }
   }
}
