import Foundation

public class CubicCurveUtils {
   /**
    * Returns point on a CubicCurve for - Parameter: t (0-1)
    */
   public static func pt(a1: CGPoint, a2: CGPoint, c1: CGPoint, c2: CGPoint, t: CGFloat) -> CGPoint {
      let posX: CGFloat = pow(t, 3) * (a2.x + 3 * (c1.x - c2.x) - a1.x) + 3 * pow(t, 2) * (a1.x - 2 * c1.x + c2.x) + 3 * t * (c1.x - a1.x) + a1.x
      let posY: CGFloat = pow(t, 3) * (a2.y + 3 * (c1.y - c2.y) - a1.y) + 3 * pow(t, 2) * (a1.y - 2 * c1.y + c2.y) + 3 * t * (c1.y - a1.y) + a1.y
      return .init(x: posX, y: posY)
   }
   /**
    * Returns Y given X on a CubicPath segment
    * - Parameters:
    *   - p0: prev end point
    *   - c0: controllpoint 1 for prev end point
    *   - c1: control point 2 for end point
    *   - p1: end point
    */
   public static func point(p0: CGPoint, c0: CGPoint, c1: CGPoint, p1: CGPoint, x: CGFloat) -> CGPoint {
      let a: CGFloat = p0.x
      let b: CGFloat = c0.x
      let c: CGFloat = c1.x
      let d: CGFloat = p1.x
      //
      let A: CGFloat = d - 3 * c + 3 * b - a
      let B: CGFloat = 3 * c - 6 * b + 3 * a
      let C: CGFloat = 3 * b - 3 * a
      let D: CGFloat = a - x
      // So we need to solve At³ + Bt² + Ct + D = 0
      let t: CGFloat = CubicCurveUtils.cubic(A, B, C, D)
      // Replace the t on Bezier function and get x,y
      return CubicCurveUtils.pnt(p0, c0, c1, p1, t)
   }
}
/**
 * Private helper
 */
extension CubicCurveUtils {
   /**
    * Returns point on a CubicCurve for - Parameter: t (0-1)
    */
   private static func pnt(_ a: CGPoint, _ b: CGPoint, _ c: CGPoint, _ d: CGPoint, _ t: CGFloat) -> CGPoint {
      let mt: CGFloat = 1 - t
      let mt2: CGFloat = mt * mt
      let mt3: CGFloat = mt2 * mt
      /*fx(t) = x1 * (1-t)³ + x2 * 3 * (1-t)²t + x3 * 3 * (1-t)t² + x4 * t³*/
      let x: CGFloat = a.x * mt3 + b.x * 3 * mt2 * t + c.x * 3 * mt * t * t + d.x * t * t * t
      /*fy(t) = y1 * (1-t)³ + y2 * 3 * (1-t)²t + y3 * 3 * (1-t)t² + y4 * t³*/
      let y: CGFloat = a.y * mt3 + b.y * 3 * mt2 * t + c.y * 3 * mt * t * t + d.y * t * t * t
      return CGPoint(x: x, y: y)
   }
   /**
    * Cubic Equation Calculator
    * refer to http://www.1728.org/cubic.htm
    * - Note: FORMULA: ax³ + bx² + cx + d = 0
    */
   private static func cubic(_ a: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
      var d: CGFloat = d // May not work, could be inout?!? seems to work regardless
      var m: CGFloat = 0
      var m2: CGFloat = 0
      var k: CGFloat = 0
      var n: CGFloat = 0
      var n2: CGFloat = 0
      var x: CGFloat = 0
      var r: CGFloat = 0
      var rc: CGFloat = 0
      var theta: CGFloat = 0
      var sign: CGFloat = 0
      var dans: CGFloat = 0
      let f: CGFloat = (((3 * c) / a) - (((b * b) / (a * a)))) / 3
      let b3: CGFloat = b * b * b
      let a3: CGFloat = a * a * a
      let a2: CGFloat = a * a
      let g: CGFloat = ((2 * ((b3) / (a3)) - (9 * b * c / (a2)) + ((27 * (d / a))))) / 27
      let h: CGFloat = (((g * g) / 4) + ((f * f * f) / 27))
      if h > 0 {
         m = -(g / 2) + (sqrt(h))
         k = m < 0 ? -1 : 1
         m2 = pow((m * k), (1 / 3))
         m2 *= k
         n = -(g / 2) - (sqrt(h))
         k = n < 0 ? -1 : 1
         n2 = pow((n * k), (1 / 3))
         n2 *= k
         x = (m2 + n2) - (b / (3 * a))
      } else {
         r = sqrt((g * g / 4) - h)
         k = r < 0 ? -1 : 1
         rc = pow((r * k), (1 / 3)) * k
         theta = acos((-g / (2 * r)))
         x = 2 * (rc * cos(theta / 3)) - (b / (3 * a))
         x *= 1E+14
         x = round(x)
         x /= 1E+14
      }
      if f + g + h == 0 {
         if d < 0 {
            sign -= 1
         }
         if d >= 0 {
            sign = 1
         }
         if sign > 0 {
            dans = pow(d / a, 1 / 3)
            dans *= -1
         }
         if sign < 0 {
            d *= -1
            dans = pow(d / a, 1 / 3)
         }
         x = dans
      }
      return x
   }
}
