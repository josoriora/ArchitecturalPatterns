//
//  EmailValidatorImplTests.swift
//  CocktailAppTests
//
//  Created by Sr. Oso on 12/05/21.
//

import XCTest
@testable import CocktailApp

class EmailValidatorImplTests: XCTestCase {
    let sut = EmailValidatorImpl()
    
    func testInvalidNilEmail() throws {
        XCTAssertFalse(sut.isValidEmail(nil))
    }
    
    func testInvalidStringEmail() throws {
        XCTAssertFalse(sut.isValidEmail("email"))
    }
    
    func testValidEmail() throws {
        XCTAssertTrue(sut.isValidEmail("julian@test.com"))
    }
}
