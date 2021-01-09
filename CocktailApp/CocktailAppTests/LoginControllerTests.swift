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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginControllerCreation() throws {
        let loginController = LoginController(email: email, password: password)
        
        XCTAssertNotNil(loginController)
    }
    
    func testInvalidNilEmail() throws {
        let loginController = LoginController(email: nil, password: password)
        
        XCTAssertFalse(loginController.isValidEmail)
    }
    
    func testInvalidStringEmail() throws {
        let loginController = LoginController(email: "email", password: password)
        
        XCTAssertFalse(loginController.isValidEmail)
    }
    
    func testValidEmail() throws {
        let loginController = LoginController(email: email, password: password)
        
        XCTAssertTrue(loginController.isValidEmail)
    }
    
    func testInvalidNilPassword() {
        let loginController = LoginController(email: email, password: nil)
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidStringPassword() {
        let loginController = LoginController(email: email, password: "pass")
               
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidOneUpperCasePassword() {
        let loginController = LoginController(email: email, password: "P")
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidOneUpperCaseOneLowerCasePassword() {
        let loginController = LoginController(email: email, password: "Pa")
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidOneUpperCaseOneNumberPassword() {
        let loginController = LoginController(email: email, password: "P4")
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testInvalidOneLowerCaseOneNumberPassword() {
        let loginController = LoginController(email: email, password: "p4")
        
        XCTAssertFalse(loginController.isValidPassword)
    }
    
    func testValidPassword() {
        let loginController = LoginController(email: email, password: "P4s")
        
        XCTAssertTrue(loginController.isValidPassword)
    }
}


