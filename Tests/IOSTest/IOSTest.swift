import XCTest
@testable import GeomKit

class IOSTest: XCTestCase {
   override func setUp() {
      super.setUp()
   }
   override func tearDown() {
      super.tearDown()
   }
   func testExample() {
//      XCTAssertEqual("Hello, World!", "Hello, World!")
      IOSTest.cgPointModifierTest()
   }
   func testPerformanceExample() {
      self.measure { }
   }
}
extension {
   /**
    * cgPointParserTest
    */
   private static func cgPointModifierTest() {
      XCTAssertEqual(CGPointModifier.multiply(a: .init(x: 20, y: 20), .init(x: 2, y: 2)), .init(x: 40, y: 40))
   }
   /**
    * cgPointParserTest
    */
   private static func cgPointParserTest() {
      XCTAssertEqual(CGPoint(x: 20, y: 20), CGPoint(x: -40, y: -40), (x: -60, y: -60))//Output:
      XCTAssertEqual(CGPoint(x: 20, y: 20), CGPoint(x: 40, y: -40),  (x: 20, y: -60))//Output:
      XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 2, y: 2), p2: CGPoint(x: 4, y: 4)), (x: 2, y: 2))//Outputs:
      XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 2, y: 2), p2: CGPoint(x: -4, y: -4)), (x: -6, y: -6))//Outputs:
      XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: -2, y: -2), p2: CGPoint(x: -4, y: -4)), (x: -2, y: -2))//Outputs:
      XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: -2, y: -2), p2: CGPoint(x: 4, y: 4)), (x: 6, y: 6))//Outputs:
      XCTAssertEqual(CGPointParser.midPt(CGPoint(x: 50,y: 50), CGPoint(x: 100, y: 100)), CGPoint(x: 75, y: 75))// 
   }
   /**
    * cgPointTransformationTest
    */
   private static func cgPointTransformationTest() {
      XCTAssertEqual(CGPointTransformation.scale(p: CGPoint(x: 0, y: 0), pivot: CGPoint(x: 40, y: 40), scale: CGPoint(x: 2, y: 2)), (x: -40.0, y: -40.0)) // Output:
      XCTAssertEqual(CGPointTransformation.scalePoints(points: [CGPoint(x: 100, y: 100)], pivot: CGPoint(x: 50,y: 50), scale: .init(x: 1, y: 1.5)).first,  CGPoint(x: 100, y: 125)) //
   }
   /**
    * cgPointTrig
    */
   private static func cgPointTrig() {
      XCTAssertEqual(CGPointTrig.polar(radius: 100, angle: π / 4), CGPoint(X: 70.710_678_118_654_8, y: 70.710_678_118_654_7))// polarPoint:   bottomRight corner
      XCTAssertEqual(CGPointTrig.x(CGPoint(x: 100, y: 100), slope: 1), 200)//Output:
      XCTAssertEqual(CGPointTrig.y(CGPoint(x: 100,y: 100), 1), 200);//Output: 200
   }
   /**
    * cgRectAsserterTest
    */
   func cgRectAsserterTest() {
      XCTAssertFalse(CGRectAsserter.intersectsLine(rect: .init(x: 200, y: 200, width: 500, height: 500), (p1: CGPoint(x: 0, y: 0), p2: CGPoint(x: 60, y: 60)))) // false
   }
}
