//
//  PasswordValidatorImplTests.swift
//  CocktailAppTests
//
//  Created by Sr. Oso on 12/05/21.
//

import XCTest
@testable import CocktailApp

class PasswordValidatorImplTests: XCTestCase {
    let sut = PasswordValidatorImpl()

    func testInvalidNilPassword() throws {
        XCTAssertFalse(sut.isValidPassword(nil))
    }
    
    func testInvalidStringPassword() throws {
        XCTAssertFalse(sut.isValidPassword("pass"))
    }
    
    func testInvalidOneUpperCasePassword() throws {
        XCTAssertFalse(sut.isValidPassword("P"))
    }
    
    func testInvalidOneUpperCaseOneLowerCasePassword() throws {
        XCTAssertFalse(sut.isValidPassword("Pa"))
    }
    
    func testInvalidOneUpperCaseOneNumberPassword() throws {
        XCTAssertFalse(sut.isValidPassword("P4"))
    }
    
    func testInvalidOneLowerCaseOneNumberPassword() throws {
        XCTAssertFalse(sut.isValidPassword("p4"))
    }
    
    func testValidPassword() throws  {
        XCTAssertTrue(sut.isValidPassword("P4s"))
    }
}
