import Foundation

public class UIntParser {
   /**
    * Returns a normalized unsigned integer value
    * - Note: great for iterating uint arrays
    * - Note: if the PARAM: index is the same as the PARAM: len then 0 is returned
    * - Note: can be used for looping items in an array
    * ## Examples:
    * print(UintParser.normalize(0, 4));//0
    * print(UintParser.normalize(1, 4));//1
    * print(UintParser.normalize(2, 4));//2
    * print(UintParser.normalize(3, 4));//3
    * print(UintParser.normalize(4, 4));//0
    * print(UintParser.normalize(5, 4));//1
    * print(UintParser.normalize(6, 4));//2
    * print(UintParser.normalize(7, 4));//3
    * print(UintParser.normalize(8, 4));//0
    */
   public static func normalize(_ index: UInt, _ len: UInt) -> UInt {
      return index < len ? index : index % len
   }
   /**
    * Adds a zero infront of a number
    * - Fixme: ⚠️️ refactor this code when you have time
    * ## Examples: Swift.print(UIntParser.digit(9, 2))
    */
   public static func digit(_ n: UInt, _ numOfDigits: Int) -> String {
      let stringNum: String = .init(n)
      let leftOver: Int = numOfDigits - stringNum.count
      let strArr: [String] = .init(repeating: "0", count: leftOver)
      let str: String = strArr.joined()
      return str + String(n)
   }
}
