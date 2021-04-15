//
//  ViewController.swift
//  CocktailApp
//
//  Created by Emergency on 29/11/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginController: LoginController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginFacade = LoginFacade(backEndStore: UserDefaultsBackEndStore())
        loginController = LoginController(loginOperations: loginFacade, email: nil, password: nil)
        
        self.loginButton.isEnabled = false
        self.loginButton.setTitleColor(.red, for: .disabled)
        self.loginButton.setTitleColor(.systemBlue, for: .normal)
    }

    @IBAction func onLoginTap(_ sender: UIButton) {
        
    }
    
    @discardableResult
    func defineLoginButtonState() -> UIControl.State {
        let isEnabled = loginController.isValidPassword && loginController.isValidEmail
        
        self.loginButton.isEnabled = isEnabled
        
        return self.loginButton.state
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            loginController.email = textField.text
        } else {
            loginController.password = textField.text
        }
        
        self.defineLoginButtonState()
        textField.resignFirstResponder()
    }
    
}
