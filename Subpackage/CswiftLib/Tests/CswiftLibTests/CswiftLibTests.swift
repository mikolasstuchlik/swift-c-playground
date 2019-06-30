import XCTest
@testable import CswiftLib

final class CswiftLibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CswiftLib().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
