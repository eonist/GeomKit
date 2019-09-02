import Foundation

public class IntAsserter {
   /**
    * Asserts if an int is odd or even
    */
   public static func odd(_ int: Int) -> Bool {
      if int % 2 == 0 {
       return false
      } else {
       return true
      }
   }
	/**
    * random true or flase
    */
   public var eitherOr: Bool { return Bool.random() }//{return arc4random_uniform(2) == 0}
}
