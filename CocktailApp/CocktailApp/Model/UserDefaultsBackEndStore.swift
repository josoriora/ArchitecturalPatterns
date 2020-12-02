//
//  UserDefaultsBackEndStore.swift
//  CocktailApp
//
//  Created by Emergency on 2/12/20.
//

import Foundation

struct UserDefaultsBackEndStore: BackEndStore {
    func fetchUserWith(email: String, response: (User?) -> ()) {
        guard let data = UserDefaults.standard.data(forKey: email) else {
            response(nil)
            return
        }
        
        let decoder = JSONDecoder()
        let user = try? decoder.decode(User.self, from: data)
        
        if let user = user {
            response(user)
        } else {
            response(nil)
        }
    }
    
    func saveUser(user: User, response: (Bool) -> ()) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(user)
        
        if let data = data {
            UserDefaults.standard.set(data, forKey: user.email)
            response(true)
        } else {
            response(false)
        }
    }
}
