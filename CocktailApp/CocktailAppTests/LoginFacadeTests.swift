//
//  LoginFacadeTests.swift
//  CocktailAppTests
//
//  Created by Emergency on 29/11/20.
//

import XCTest
@testable import CocktailApp

class LoginFacadeTests: XCTestCase {
    let email = "julian@test.com"
    let password = "12345"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        UserDefaults.standard.removeObject(forKey: email)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAccountCreation() throws {
        let loginFacade = LoginFacade(backEndStore: UserDefaultsBackEndStore())
        let registrationExpectation = self.expectation(description: "registration")
        let loginExpectation = self.expectation(description: "login")
        
        loginFacade.loginWith(email: email,
                              password: password) { (response: LoginFacade.LoginResponse) in
            XCTAssertEqual(response.status, .registration)
            XCTAssertEqual(response.user?.email, email)
            registrationExpectation.fulfill()
        }
        
        loginFacade.loginWith(email: email,
                              password: password) { (response: LoginFacade.LoginResponse) in
            XCTAssertEqual(response.status, .login)
            XCTAssertEqual(response.user?.email, email)
            loginExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.5, handler: nil)
    }

}
