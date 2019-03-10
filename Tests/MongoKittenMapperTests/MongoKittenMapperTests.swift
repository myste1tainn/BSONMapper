import XCTest
@testable import MongoKittenMapper

final class MongoKittenMapperTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MongoKittenMapper().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
