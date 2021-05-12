//
//  LoginController.swift
//  CocktailApp
//
//  Created by Emergency on 9/01/21.
//

import Foundation

struct LoginController {
    var email: String?
    var password: String?
    let loginOperations: LoginOperationsProtocol
    let emailValidator: EmailValidatorProtocol
    let passwordValidator: PasswordValidatorProtocol
    
    init(loginOperations: LoginOperationsProtocol,
         emailValidator: EmailValidatorProtocol = EmailValidatorImpl(),
         passwordValidator: PasswordValidatorProtocol = PasswordValidatorImpl(),
         email: String?,
         password: String?) {
        self.loginOperations = loginOperations
        self.emailValidator = emailValidator
        self.passwordValidator = passwordValidator
        self.email = email
        self.password = password
    }
    
    var isValidEmail: Bool {
        return emailValidator.isValidEmail(email)
    }
    
    var isValidPassword: Bool {
        return passwordValidator.isValidPassword(password)
    }
    
    func login(completion: @escaping (LoginControllerResponse) -> ()) {
        guard
            let email = self.email, self.isValidEmail,
            let password = self.password, self.isValidPassword
        else {
            return
        }
        
        loginOperations.loginWith(email: email, password: password) { (loginResponse: LoginResponse) in
            completion(LoginControllerResponse(status: loginResponse.status))
        }
    }
}

struct LoginControllerResponse {
    let status: LoginStatus
}
