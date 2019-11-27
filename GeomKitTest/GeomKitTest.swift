import XCTest

class GeomKitTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      _ = { // Interpolation
         let result = CGPointParser.interpolate(a: .zero, b: .init(x: 10, y: 10), scalar: 0.5)
         Swift.print("result:  \(result)")
         XCTAssertEqual(result, CGPoint(x: 5, y: 5))
      }()
      _ = { // Difference
         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 20, y: 20), p2: CGPoint(x: -40, y: -40)), CGPoint(x: -60, y: -60))//Output:
         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 20, y: 20), p2: CGPoint(x: 40, y: -40)), CGPoint(x: 20, y: -60))//Output:
         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 2, y: 2), p2: CGPoint(x: 4, y: 4)), CGPoint(x: 2, y: 2))//Outputs:
         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 2, y: 2), p2: CGPoint(x: -4, y: -4)), CGPoint(x: -6, y: -6))//Outputs:
         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: -2, y: -2), p2: CGPoint(x: -4, y: -4)), CGPoint(x: -2, y: -2))//Outputs:
         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: -2, y: -2), p2: CGPoint(x: 4, y: 4)), CGPoint(x: 6, y: 6))//Outputs:
      }()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
