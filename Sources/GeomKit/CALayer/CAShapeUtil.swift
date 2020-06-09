#if os(iOS)
import UIKit
public typealias Color = UIColor
#elseif os(macOS)
import Cocoa
public typealias Color = NSColor
#endif
/**
 * CGShapeUtil
 */
public class CGShapeUtil {
   /**
    * Draw line
    * - Note: remember to: shapeLayer.addSublayer(lineLayer)
    * It's also possible to do this with UIBezierPath:
    * let path: UIBezierPath = {
    *    let aPath = UIBezierPath.init() // cgPath: linePath
    *    aPath.move(to: p1)
    *    aPath.addLine(to: p2)
    *    aPath.close() // Keep using the method addLineToPoint until you get to the one where about to close the path
    *    return aPath
    * }()
    * ## Examples:
    * CGShapeUtil.drawLine(shapeLayer: nil, line: (.zero, .zero), (.green, 1))
    */
   @discardableResult
   public static func drawLine(shapeLayer: CAShapeLayer?, line: Line, style: LineStyle) -> CAShapeLayer {
      let shapeLayer: CAShapeLayer = shapeLayer ?? .init()
      let path: CGMutablePath = .init()
      path.move(to: line.p1)
      path.addLine(to: line.p2)
      shapeLayer.path = path // Setup the CAShapeLayer with the path, colors, and line width
      shapeLayer.strokeColor = style.stroke.cgColor
      shapeLayer.lineWidth = style.thickness
      shapeLayer.lineCap = .round
      return shapeLayer
   }
   /**
    * Draws a polyline to a CGShapeLayer
    * - Abstract: A polyline is a continouse line from point to point
    * ## Example:
    * CGShapeUtil.drawPolyLine(shapeLayer: nil, points: [.zero, .zero, .zero], style: (nil, .black, 1), close: true) // Draws a triangle with black stroke of 1.0 of thickness
    * - Parameter shapeLayer: the layer to draw into, this layer is also returned (if param is nil, then a shapeLayer is created)
    */
   @discardableResult
   public static func drawPolyLine(shapeLayer: CAShapeLayer?, points: [CGPoint], style: Style?, close: Bool = false) -> CAShapeLayer {
      let shapeLayer: CAShapeLayer = shapeLayer ?? .init()
      let path: CGMutablePath = CGPathParser.polyLine(points: points, close: close)
      shapeLayer.path = path // Setup the CAShapeLayer with the path, colors, and line width
      shapeLayer.strokeColor = style?.strokeColor?.cgColor
      shapeLayer.lineWidth = style?.thickness ?? shapeLayer.lineWidth
      shapeLayer.fillColor = style?.fillColor?.cgColor
      return shapeLayer
   }
   /**
    * Draws a rectangle in shapeLayer
    * ## Examples:
    * let rectShape = CGShapeUtil.drawRect(shapeLayer: .init(), .init(x: 0, y: 0, width: 100, height: 100), style(fillColor: nil, strokeColor: .black, thickness: 14))
    * view.layer.addSublayer(rectShape)
    * - Note: If you try to draw many rects on the same layer, it just gets overwritten, rather add sub layers
    */
   @discardableResult
   public static func drawRect(shapeLayer: CAShapeLayer?, rect: CGRect, style: Style?) -> CAShapeLayer {
      let shapeLayer: CAShapeLayer = shapeLayer ?? .init()
      let path: CGMutablePath = .init()
      path.addRect(rect)
      shapeLayer.path = path
      shapeLayer.strokeColor = style?.strokeColor?.cgColor
      shapeLayer.lineWidth = style?.thickness ?? shapeLayer.lineWidth
      shapeLayer.fillColor = style?.fillColor?.cgColor
      return shapeLayer
   }
   /**
    * Draws rounded rect
    */
   @discardableResult
   public static func drawRoundedRect(shapeLayer: CAShapeLayer?, rect: CGRect, radius: CGPathParser.NSRectCorner, style: Style?) -> CAShapeLayer {
      let shapeLayer: CAShapeLayer = shapeLayer ?? .init()
      let path = CGPathParser.roundedRect(rect: rect, radius: radius)
      shapeLayer.path = path // Setup the CAShapeLayer with the path, colors, and line width
      shapeLayer.fillColor = style?.fillColor?.cgColor
      shapeLayer.strokeColor = style?.strokeColor?.cgColor
      shapeLayer.lineWidth = style?.thickness ?? shapeLayer.lineWidth
      shapeLayer.lineCap = .round
      return shapeLayer
   }
   /**
    * Draws circle
    * - Parameter: progress: 0-1
    * ## Examples:
    * let circlePath: BezierPath = .init(ovalIn: rect ) // (arcCenter: CGPoint(x: circle.center.x, y: circle.center.y), radius:circle.radius, startAngle: CGFloat(Double.pi * -0.5), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)/*The path should be the entire circle, for the strokeEnd and strokeStart to work*/
    * let circle: CAShapeLayer = CALayerUtil.drawCircle(with: nil, circle: (.zero, 40), style: (nil, .black, 1), progress: 1)
    * - Parameters:
    *   - shapeLayer: The shapeLayer to draw a circle in
    *   - circle: Radisu and pivot
    *   - style: fill, stroke, thickness
    *   - progress: 0-1
    */
   @discardableResult
   public static func drawCircle(with shapeLayer: CAShapeLayer?, circle: (center: CGPoint, radius: CGFloat), style: Style, progress: CGFloat = 1) -> CAShapeLayer {
      let shapeLayer: CAShapeLayer = shapeLayer ?? .init()
      let pt: CGPoint = .init(x: circle.center.x - circle.radius, y: circle.center.y - circle.radius)
      let size: CGSize = .init(width: circle.radius * 2, height: circle.radius * 2)
      let rect: CGRect = .init(origin: pt, size: size )
      return drawCircle(with: shapeLayer, rect: rect, style: style, progress: progress)
   }
   /**
    * Draws circle
    * - Parameter progress: 0-1
    */
   @discardableResult
   public static func drawCircle(with shapeLayer: CAShapeLayer?, rect: CGRect, style: Style?, progress: CGFloat = 1) -> CAShapeLayer {
      let shapeLayer: CAShapeLayer = shapeLayer ?? .init()
      shapeLayer.path = .init(ellipseIn: rect, transform: nil) // Setup the CAShapeLayer with the path, colors, and line width
      shapeLayer.fillColor = style?.fillColor?.cgColor
      shapeLayer.strokeColor = style?.strokeColor?.cgColor
      shapeLayer.lineWidth = style?.thickness ?? shapeLayer.lineWidth
      shapeLayer.lineCap = .round
      shapeLayer.strokeEnd = progress // Sets progress of the stroke between predefined start and predefined end
      return shapeLayer
   }
   /**
    * Add color to shape
    * - Parameters:
    *   - shape: the shape for the fill to be applied to
    *   - cgPath: the cgPath to fill inside
    *   - fillColor: the color to apply to the shape
    */
   public static func fill(shape: CAShapeLayer, cgPath: CGPath, fillColor: Color) {
      shape.path = cgPath // Setup the CAShapeLayer with the path, colors, and line width
      shape.fillColor = fillColor.cgColor
   }
}
/**
 * Draws circle
 * - Parameter: progress: 0-1
 */
//   static func drawCircle(with circleLayer:CAShapeLayer, circle:Circle, style:Style, progress: CGFloat){
//      let circlePath = UIBezierPath(arcCenter: CGPoint(x: circle.center.x, y: circle.center.y), radius:circle.radius, startAngle: CGFloat(Double.pi * -0.5), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)/*The path should be the entire circle, for the strokeEnd and strokeStart to work*/
//      circleLayer.path = circlePath.cgPath/*Setup the CAShapeLayer with the path, colors, and line width*/
//      circleLayer.fillColor = style.fill.cgColor
//      circleLayer.strokeColor = style.stroke.cgColor
//      circleLayer.lineWidth = style.strokeWidth
//      circleLayer.lineCap = .round
//      circleLayer.strokeEnd = progress/*Sets progress of the stroke between predefined start and predefined end*/
//   }

// typealias Corners = (topLeft: CGFloat,  topRight: CGFloat,  bottomLeft: CGFloat,  bottomRight: CGFloat)
// public typealias Style = (fill: Color, stroke: Color, strokeWidth: CGFloat)
