import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   func applicationDidFinishLaunching(_ aNotification: Notification) {
      // Insert code here to initialize your application
//      _ = { // Interpolation
//         let result = CGPointParser.interpolate(a: .zero, b: .init(x: 10, y: 10), scalar: 0.5)
//         Swift.print("result:  \(result)")
//         XCTAssertEqual(result, CGPoint(x: 5, y: 5))
//      }()
//      _ = { // Difference
//         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 20, y: 20), p2: CGPoint(x: -40, y: -40)), CGPoint(x: -60, y: -60))//Output:
//         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 20, y: 20), p2: CGPoint(x: 40, y: -40)), CGPoint(x: 20, y: -60))//Output:
//         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 2, y: 2), p2: CGPoint(x: 4, y: 4)), CGPoint(x: 2, y: 2))//Outputs:
//         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: 2, y: 2), p2: CGPoint(x: -4, y: -4)), CGPoint(x: -6, y: -6))//Outputs:
//         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: -2, y: -2), p2: CGPoint(x: -4, y: -4)), CGPoint(x: -2, y: -2))//Outputs:
//         XCTAssertEqual(CGPointParser.difference(p1: CGPoint(x: -2, y: -2), p2: CGPoint(x: 4, y: 4)), CGPoint(x: 6, y: 6))//Outputs:
//      }()
   }
   func applicationWillTerminate(_ aNotification: Notification) {
      // Insert code here to tear down your application
   }
}
