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

    func testAccountCreation() throws {
        let email = "julian@test.com"
        let password = "12345"
        let loginFacade = LoginFacade()
        let response = loginFacade.loginWith(email: email, password: password)
        
        XCTAssertEqual(response.status, .registration)
        XCTAssertEqual(response.user?.email, email)
    }

}

enum LoginStatus {
    case registration
    case unknown
}

struct User {
    let email: String
    let password: String
}

class LoginFacade {
    
    struct LoginResponse {
        let status: LoginStatus
        let user: User?
    }
    
    func loginWith(email: String, password: String) -> LoginResponse {
        return LoginResponse(status: .unknown, user: nil)
    }
}
