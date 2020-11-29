//
//  LoginFacadeTests.swift
//  CocktailAppTests
//
//  Created by Emergency on 29/11/20.
//

import XCTest

class LoginFacadeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAccountCreation() {
        let email = "julian@test.com"
        let password = "12345"
        let success = LoginFacade.loginWith(email: email, password: password)
        
        XCTAssertTrue(success)
    }

}

class LoginFacade {
    class func loginWith(email: String, password: String) -> Bool {
        return false
    }
}
