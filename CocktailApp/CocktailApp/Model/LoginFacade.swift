//
//  LoginFacade.swift
//  CocktailApp
//
//  Created by Emergency on 2/12/20.
//

import Foundation

enum LoginStatus {
    case registration
    case login
    case unknown
    case authError
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
        self.backEndStore.fetchUserWith(email: email) { [weak self] (user: User?) in
            guard let user = user  else {
                let newUser = User(email: email, password: password)
                
                guard let weakSelf = self else {
                    let regResponse = LoginResponse(status: .unknown, user: nil)
                    
                    response(regResponse)
                    return
                }
                
                weakSelf.backEndStore.saveUser(user: User(email: email, password: password)) { (success: Bool) in
                    if success {
                        let regResponse = LoginResponse(status: .registration, user: newUser)
                        
                        response(regResponse)
                    } else {
                        let regResponse = LoginResponse(status: .unknown, user: nil)
                        
                        response(regResponse)
                    }
                }
                
                return
            }
            
            if user.password == password {
                response(LoginResponse(status: .login, user: user))
            } else {
                response(LoginResponse(status: .authError, user: nil))
            }
        }
    }
}
