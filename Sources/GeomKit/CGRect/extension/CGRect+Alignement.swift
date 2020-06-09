import CoreGraphics
/**
 * Alignment
 * - Fixme: Possibly make this CGRectAlignment.topLeft(rect)
 */
fileprivate typealias CGRectangle = CGRect

extension CGRectangle {
   public var topLeft: CGPoint { self.origin }
   public var bottomLeft: CGPoint { .init(x: self.minX, y: self.maxY) }
   public var bottomRight: CGPoint { .init(x: self.maxX, y: self.maxY) }
   public var topRight: CGPoint { .init(x: self.maxX, y: self.minY) }
   public var center: CGPoint { .init(x: self.midX, y: self.midY) }
   public var top: CGPoint { .init(x: self.midX, y: self.minY) }
   public var bottom: CGPoint { .init(x: self.midX, y: self.maxY) }
   public var left: CGPoint { .init(x: self.maxX, y: self.midY) }
   public var right: CGPoint { .init(x: self.minX, y: self.midY) }
}
