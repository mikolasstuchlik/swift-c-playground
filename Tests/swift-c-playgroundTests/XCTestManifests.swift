import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(swift_c_playgroundTests.allTests),
    ]
}
#endif
