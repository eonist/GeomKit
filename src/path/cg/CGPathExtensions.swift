import Foundation

extension CGMutablePath{
    /**
     * Returns a copy of it self
     * - Note: this was previously copy, but swift 3 uses this method
     */
    public func clone() -> CGMutablePath? {
        return self.mutableCopy()
    }
    public func moveTo(x: CGFloat, y: CGFloat) { // Convenince
        self.move(to: .init(x, y))
    }
    public func moveTo(p: CGPoint) { // Convenince
        self.move(to: p)
    }
    /**
     * Convenince
     * - Note: If `delta' is positive, then the arc is drawn counter-clockwise; if negative, clockwise.
     */
    public func addRelativeArc(center: CGPoint, xRadii: CGFloat, startAngle: CGFloat, delta: CGFloat, matrix: CGAffineTransform) {
        self.addRelativeArc(center: center, radius: xRadii, startAngle: startAngle, delta: delta, transform: matrix) // swift 3 updated
    }
}
extension CGPath {
    /**
     * - Note: this method is used in DrawLab when Converting CGPath to Path
     * - Note: Great method for parsing through CGPath instances
     * - Fixme: ⚠️️ swift 3 update, this method changed drastically, I think Oleb from obj-c.io has a swift 3 version of this that is better.
     */
    public func forEach(body: @convention(block) (CGPathElement) -> Void) {
        typealias Body = @convention(block) (CGPathElement) -> Void
        func callback(info: UnsafeMutableRawPointer, element: UnsafePointer<CGPathElement>) {
            let body = unsafeBitCast(info, to: Body.self)
            body(element.pointee)
        }
      fatalError("out of order in swift 4.2")
        //Swift.print(MemoryLayout.size(ofValue: body))
        //let unsafeBody = unsafeBitCast(body, to: UnsafeMutableRawPointer.self)
        //self.apply(info: unsafeBody, function: callback as! CGPathApplierFunction)
    }
}
