//
//  LoginRegisterViewController.swift
//  YI
//
//  Created by Lina Li on 2020-09-30.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginRegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButton(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextField.text!) { authResult, error in
         if (error == nil)
         {
            print("konto är ok")
            self.dismiss(animated: false, completion: nil)
         } else
//        code for infoming user about errors
         {
           
            print("skapa konto error")
            print(error?.localizedDescription)
            self.errorLabel.text = error?.localizedDescription
        }
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextField.text!) { AuthResult, error in
            if (error == nil )
            {
//                login är ok
                print("login ok")
                self.dismiss(animated: false, completion: nil)
            } else{
                print("login error")
                print(error?.localizedDescription)
                self.errorLabel.text = error?.localizedDescription
            }
        }
}
    @IBAction func Noacount(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
