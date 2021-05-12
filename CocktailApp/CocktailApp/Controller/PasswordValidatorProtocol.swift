//
//  PasswordValidatorProtocol.swift
//  CocktailApp
//
//  Created by Sr. Oso on 12/05/21.
//

import Foundation

protocol PasswordValidatorProtocol {
    func isValidPassword(_ password: String?) -> Bool
}

struct PasswordValidatorImpl: PasswordValidatorProtocol {
    func isValidPassword(_ password: String?) -> Bool {
        guard let password = password, password.count >= 3 else { return false }
        
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
