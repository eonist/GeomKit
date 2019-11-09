import Foundation
/**
 * Definition of Asserter: state a fact or belief confidently and forcefully
 * - Fixme: ⚠️️ Rename this to CGFloatAsserter, and then make a typeAlias to NumberAsserter -> to not break legacy code. (Do the same with PointAserter etc)
 */
public class CGFloatAsserter {
   public static let epsilon: CGFloat = 10e-12
   /**
    * Return: true if number is odd
    * ## Examples:
    * print(NumberAsserter.odd(0));//false
    * print(NumberAsserter.odd(1));//true
    * print(NumberAsserter.odd(2));//false
    * print(NumberAsserter.odd(3));//true
    * print(NumberAsserter.odd(4));//false
    */
   public static func odd(_ number: CGFloat) -> Bool {
      return (number %% 2) != 0.0
   }
   /**
    * ## Examples: event(0), even(2), even(4)
    */
   public static func even(_ number: CGFloat) -> Bool {
      return !odd(number)
   }
   /**
    * - - Note: You can do Swift.abs(4.1 - 4.0) <= 0.1 // true,where 0.1 is the epsilon (also works for negative values)
    * ## Examples:
    * Swift.print(NumberAsserter.isNear(-1.8650465545944293 , -1.8650465545944273, NumberAsserter.EPSILON));//true, result is 10e-15 which is less than 10e-12
    */
   public static func isNear(_ a: CGFloat, _ b: CGFloat, _ epsilon: CGFloat = 10e-12) -> Bool {//this could also be named almostEqual
      if a == b { return true }
      else {
         let result: CGFloat = Swift.max(a, b) - Swift.min(a, b)
         return result < epsilon // Fixme: ⚠️️  we could do <= here
      }
   }
   /**
    * UnLike isNear, this returns true for cases where the value is within epsilon and on epsiolon, see examples bellow:
    * - Note: The computation is also simpler and faster
    * ## Examples: near(40, 50, 10) // true
    * ## Examples: near(-40, -50, 10) // true
    * ## Examples: near(-10, 0, 10) // true
    * ## Examples: near(10, 0, 10) // true
    * ## Examples: near(-60, -50, 10) // true
    */
   public static func near(_ a: CGFloat, _ b: CGFloat, _ epsilon: CGFloat) -> Bool {
      return abs(a - b) <= epsilon
   }
   /**
    * - Note: unlike the native "==" method this method supports NaN values
    */
   public static func equals(_ a: CGFloat, _ b: CGFloat) -> Bool {
      return (a.isNaN && b.isNaN) || a == b
   }
   /**
    * - Note: you can also use Number.NEGATIVE_INFINITY and Number.POSITIVE_INFINITY
    */
   public static func isInfinity(_ number: CGFloat) -> Bool {
      return number == CGFloat.infinity || number == -CGFloat.infinity
   }
}
