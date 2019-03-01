import XCTest
@testable import Blackjack

final class BlackjackTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Blackjack().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
