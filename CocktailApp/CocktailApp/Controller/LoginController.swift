//
//  LoginController.swift
//  CocktailApp
//
//  Created by Emergency on 9/01/21.
//

import Foundation

struct LoginController {
    let email: String?
    let password: String?
    
    var isValidEmail: Bool {
        guard let email = self.email else { return false }
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    var isValidPassword: Bool {
        guard let password = self.password, password.count >= 3 else { return false }
        
        var upperCaseCount = 0
        var lowerCaseCount = 0
        var numberCount = 0
        
        password.forEach { (character: Character) in
            upperCaseCount += character.isUppercase ? 1 : 0
            lowerCaseCount += character.isLowercase ? 1 : 0
            numberCount += character.isNumber ? 1 : 0
        }
        
        return upperCaseCount > 0 && lowerCaseCount > 0 && numberCount > 0
    }
}
