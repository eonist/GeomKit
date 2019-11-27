import CoreGraphics
/**
 * Alignment
 * - Fixme: Possibly make this CGRectAlignment.topLeft(rect)
 */
fileprivate typealias CGRectangle = CGRect
extension CGRectangle {
   public var topLeft: CGPoint { return self.origin }
   public var bottomLeft: CGPoint { return .init(x: self.minX, y: self.maxY) }
   public var bottomRight: CGPoint { return .init(x: self.maxX, y: self.maxY) }
   public var topRight: CGPoint { return .init(x: self.maxX, y: self.minY) }
   public var center: CGPoint { return .init(x: self.midX, y: self.midY) }
   public var top: CGPoint { return .init(x: self.midX, y: self.minY) }
   public var bottom: CGPoint { return .init(x: self.midX, y: self.maxY) }
   public var left: CGPoint { return .init(x: self.maxX, y: self.midY) }
   public var right: CGPoint { return .init(x: self.minX, y: self.midY) }
}
