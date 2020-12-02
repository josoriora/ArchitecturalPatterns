//
//  BackEndStoreProtocol.swift
//  CocktailApp
//
//  Created by Emergency on 2/12/20.
//

import Foundation

protocol BackEndStore {
    func fetchUserWith(email: String, response: (User?) -> () )
    func saveUser(user: User, response: (Bool) ->())
}
