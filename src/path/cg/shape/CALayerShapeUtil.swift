#if os(iOS)
import UIKit
public typealias Color = UIColor
#elseif os(macOS)
import Cocoa
public typealias Color = NSColor
#endif
/**
 * Typealias
 */
extension CGShapeUtil {
   public typealias Line = (p1: CGPoint, p2: CGPoint)
   public typealias LineStyle = (stroke: Color, strokeWidth: CGFloat)
   public typealias Style = (fillColor: Color?, strokeColor: Color?, thickness: CGFloat?)
}
/**
 * CGShapeUtil
 */
public class CGShapeUtil {
   // typealias Corners = (topLeft: CGFloat,  topRight: CGFloat,  bottomLeft: CGFloat,  bottomRight: CGFloat)
   // public typealias Style = (fill: Color, stroke: Color, strokeWidth: CGFloat)
   /**
    * Draw line
    * - Note: remember to: shapeLayer.addSublayer(lineLayer)
    * It's also possible to do this with UIBezierPath
    * let path: UIBezierPath = {
    *    let aPath = UIBezierPath.init()//cgPath: linePath
    *    aPath.move(to: p1)
    *    aPath.addLine(to: p2)
    *    aPath.close()//Keep using the method addLineToPoint until you get to the one where about to close the path
    *    return aPath
    * }()
    */
   public static func drawLine(lineLayer: CAShapeLayer, line: Line, style: LineStyle) -> CAShapeLayer {
      let lineLayer: CAShapeLayer = .init()
      let path: CGMutablePath = .init()
      path.move(to: line.p1)
      path.addLine(to: line.p2)
      lineLayer.path = path // Setup the CAShapeLayer with the path, colors, and line width
      lineLayer.strokeColor = style.stroke.cgColor
      lineLayer.lineWidth = style.strokeWidth
      lineLayer.lineCap = .round
      return lineLayer
   }
   /**
    * polyline
    */
   public static func drawPolyLine(points: [CGPoint], style: Style?, close: Bool = false) -> CAShapeLayer {
      let shapeLayer: CAShapeLayer = .init()
      let path: CGMutablePath = CGPathParser.polyLine(points: points, close: close)
      shapeLayer.path = path // Setup the CAShapeLayer with the path, colors, and line width
      shapeLayer.strokeColor = style?.strokeColor?.cgColor
      shapeLayer.lineWidth = style?.thickness ?? shapeLayer.lineWidth
      shapeLayer.fillColor = style?.fillColor?.cgColor
      return shapeLayer
   }
   /**
    * Draws a rectange in shapeLayer
    * ## Examples:
    * let rectShape = CGShapeUtil.drawRect(shapeLayer: .init(),.init(x: 0, y: 0, width: 100, height: 100), style(nil, .black, 14))
    * view.layer.addSublayer(rectShape)
    */
   public static func drawRect(shapeLayer: CAShapeLayer, rect: CGRect, style: Style?) -> CAShapeLayer {
      let path: CGMutablePath = .init()
      path.addRect(rect)
      shapeLayer.path = path
      shapeLayer.strokeColor = style?.strokeColor?.cgColor
      shapeLayer.lineWidth = style?.thickness ?? shapeLayer.lineWidth
      shapeLayer.fillColor = style?.fillColor?.cgColor
      return shapeLayer
   }
   /**
    * Draws circle
    * - - Parameter: progress: 0-1
    * ## Examples:
    * let circlePath: BezierPath = .init(ovalIn: rect )// (arcCenter: CGPoint(x: circle.center.x, y: circle.center.y), radius:circle.radius, startAngle: CGFloat(Double.pi * -0.5), endAngle: CGFloat(Double.pi * 1.5), clockwise: true)/*The path should be the entire circle, for the strokeEnd and strokeStart to work*/
    */
   public static func drawCircle(with circleLayer: CAShapeLayer, circle: (center: CGPoint, radius: CGFloat), style: Style, progress: CGFloat) -> CAShapeLayer {
      let pt: CGPoint = .init(x: circle.center.x - circle.radius, y: circle.center.y - circle.radius)
      let size: CGSize = .init(width: circle.radius * 2, height: circle.radius * 2)
      let rect: CGRect = .init(origin: pt, size: size )
      return drawCircle(with: circleLayer, rect: rect, style: style, progress: progress)
   }
   /**
    * Draws circle
    * - - Parameter: progress: 0-1
    */
   public static func drawCircle(with circleLayer: CAShapeLayer, rect: CGRect, style: Style?, progress: CGFloat) -> CAShapeLayer {
      circleLayer.path = .init(ellipseIn: rect, transform: nil) // Setup the CAShapeLayer with the path, colors, and line width
      circleLayer.fillColor = style?.fillColor?.cgColor
      circleLayer.strokeColor = style?.strokeColor?.cgColor
      circleLayer.lineWidth = style?.thickness ?? circleLayer.lineWidth
      circleLayer.lineCap = .round
      circleLayer.strokeEnd = progress // Sets progress of the stroke between predefined start and predefined end
      return circleLayer
   }
   /**
    * Add color to shape
    * - parameter shape: the shape for the fill to be applied to
    * - parameter cgPath: the cgPath to fill inside
    * - parameter fillColor: the color to apply to the shape
    */
   public static func fill(shape: CAShapeLayer, cgPath: CGPath, fillColor: Color) {
      shape.path = cgPath // Setup the CAShapeLayer with the path, colors, and line width
      shape.fillColor = fillColor.cgColor
   }
   /**
    * Draws rounded rect
    */
   public static func drawRoundedRect(layer: CAShapeLayer, rect: CGRect, radius: CGPathParser.NSRectCorner, style: Style?) -> CAShapeLayer {
      let path = CGPathParser.roundedRect(rect: rect, radius: radius)
      layer.path = path // Setup the CAShapeLayer with the path, colors, and line width
      layer.fillColor = style?.fillColor?.cgColor
      layer.strokeColor = style?.strokeColor?.cgColor
      layer.lineWidth = style?.thickness ?? layer.lineWidth
      layer.lineCap = .round
      return layer
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
