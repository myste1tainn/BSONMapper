import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MongoKittenMapperTests.allTests),
        testCase(MapToPropertySpec.allTests),
    ]
}
#endif
