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

enum LoginStatus {
    case registration
    case login
    case unknown
}

struct User {
    let email: String
    let password: String
}

class LoginFacade {
    typealias LoginClosure = (LoginResponse) -> ()
    
    struct LoginResponse {
        let status: LoginStatus
        let user: User?
    }
    
    let backEndStore: BackEndStore
    
    init(backEndStore: BackEndStore) {
        self.backEndStore = backEndStore
    }
    
    func loginWith(email: String, password: String, response: LoginClosure) {
        
    }
}

protocol BackEndStore {
    func fetchUserWith(email: String, response: (User?) -> () )
    func saveUser(user: User, response: (Bool) ->())
}

struct UserDefaultsBackEndStore: BackEndStore {
    func fetchUserWith(email: String, response: (User?) -> ()) {
        
    }
    
    func saveUser(user: User, response: (Bool) -> ()) {
        
    }
}
