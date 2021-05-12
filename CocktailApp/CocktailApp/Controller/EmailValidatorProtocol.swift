//
//  EmailValidatorProtocol.swift
//  CocktailApp
//
//  Created by Sr. Oso on 12/05/21.
//

import Foundation

protocol EmailValidatorProtocol {
    func isValidEmail(_ email: String?) -> Bool
}

struct EmailValidatorImpl: EmailValidatorProtocol {
    func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}
