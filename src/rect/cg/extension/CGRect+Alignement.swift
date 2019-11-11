import Foundation
/**
 * Alignment
 * - Fixme: Possibly make this CGRectAlignment.topLeft(rect)
 */
extension CGRect {
   public var topLeft: CGPoint { return self.origin }
   public var bottomLeft: CGPoint { return .init(self.minX, self.maxY) }
   public var bottomRight: CGPoint { return .init(self.maxX, self.maxY) }
   public var topRight: CGPoint { return .init(self.maxX, self.minY) }
   public var center: CGPoint { return .init(self.midX, self.midY) }
   public var top: CGPoint { return .init(self.midX, self.minY) }
   public var bottom: CGPoint { return .init(self.midX, self.maxY) }
   public var left: CGPoint { return .init(self.maxX, self.midY) }
   public var right: CGPoint { return .init(self.minX, self.midY) }
}
