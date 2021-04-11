//
//  LoginOperationsProtocol.swift
//  CocktailApp
//
//  Created by Emergency on 11/04/21.
//

import Foundation

enum LoginStatus {
    case registration
    case login
    case unknown
    case authError
}

struct LoginResponse {
    let status: LoginStatus
    let user: User?
}

typealias LoginClosure = (LoginResponse) -> ()

protocol LoginOperationsProtocol {
    func loginWith(email: String, password: String, response: LoginClosure)
}
