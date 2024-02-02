//
//  MyInstagramTests.swift
//  MyInstagramTests
//
//  Created by Dhruv on 1/16/24.
//

import XCTest
@testable import MyInstagram

final class MyInstagramTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let authObject = RegistrationViewModel()
        authObject.username = ""
        authObject.email = ""
        authObject.password = ""
        let isValid = authObject.inputFieldsValid
        XCTAssertEqual(isValid, false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
