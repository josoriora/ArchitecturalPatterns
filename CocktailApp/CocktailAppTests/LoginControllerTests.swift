//
//  LoginControllerTests.swift
//  CocktailAppTests
//
//  Created by Emergency on 8/12/20.
//

import XCTest
@testable import CocktailApp

class LoginControllerTests: XCTestCase {
    let email = "julian@test.com"
    let password = "12345"
    let mockLoginOperations = MockLoginOperations()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginControllerCreation() throws {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: password)
        
        XCTAssertNotNil(loginController)
    }
    
    func testInvalidNilEmail() throws {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: nil,
                                              password: password)
        
        XCTAssertFalse(loginController.isValidEmail)
    }
    
    func testInvalidStringEmail() throws {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: "email",
                                              password: password)
        
        XCTAssertFalse(loginController.isValidEmail)
    }
    
    func testValidEmail() throws {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: password)
        
        XCTAssertTrue(loginController.isValidEmail)
    }
    
    func testInvalidNilPassword() {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: nil)
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidStringPassword() {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: "pass")
               
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidOneUpperCasePassword() {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: "P")
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidOneUpperCaseOneLowerCasePassword() {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: "Pa")
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidOneUpperCaseOneNumberPassword() {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: "P4")
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidOneLowerCaseOneNumberPassword() {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: "p4")
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testValidPassword() {
        let loginController = LoginController(loginOperations: mockLoginOperations,
                                              email: email,
                                              password: "P4s")
        
        XCTAssertTrue(loginController.isValidPassword)
    }
    
    func testRegisterLogin() {
        let loginController = LoginController(loginOperations: MockLoginOperations(status: .registration),
                                              email: email,
                                              password: "P4s")
        let expectation = self.expectation(description: "login expectation")
        
        loginController.login { (response: LoginControllerResponse) in
            XCTAssertEqual(response.status, .registration)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testLoginForAlreadyRegisteredUser() {
        let loginController = LoginController(loginOperations: MockLoginOperations(status: .login),
                                              email: email,
                                              password: "P4s")
        let expectation = self.expectation(description: "login expectation")
        
        loginController.login { (response: LoginControllerResponse) in
            XCTAssertEqual(response.status, .login)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testLoginAuthError() {
        let loginController = LoginController(loginOperations: MockLoginOperations(status: .authError),
                                              email: email,
                                              password: "P4s")
        let expectation = self.expectation(description: "login expectation")
        
        loginController.login { (response: LoginControllerResponse) in
            XCTAssertEqual(response.status, .authError)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testLoginUnknownState() {
        let loginController = LoginController(loginOperations: MockLoginOperations(status: .unknown),
                                              email: email,
                                              password: "P4s")
        let expectation = self.expectation(description: "login expectation")
        
        loginController.login { (response: LoginControllerResponse) in
            XCTAssertEqual(response.status, .unknown)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 0.2, handler: nil)
    }
}

struct MockLoginOperations: LoginOperationsProtocol {
    var status: LoginStatus = .unknown
    
    func loginWith(email: String, password: String, response: (LoginResponse) -> ()) {
        let user = User(email: email, password: password)
        let loginRespose = LoginResponse(status: self.status, user: user)
        
        response(loginRespose)
    }
}

