import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FontAwesome_swiftTests.allTests),
    ]
}
#endif
