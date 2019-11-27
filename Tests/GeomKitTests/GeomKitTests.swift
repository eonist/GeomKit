import XCTest
@testable import GeomKit

final class GeomKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GeomKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
