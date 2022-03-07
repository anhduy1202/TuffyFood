//
//  logInViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/6/22.
//

import UIKit
import FirebaseAuth


class logInViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBOutlet weak var errorMsg: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            self.errorMsg.text = "Missing field data"
            return
        }
        
      //Log in through Firebase
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let strongSelf = self else {
                print("Login Error")
                return
            }
            //Display error
            guard error == nil else {
                strongSelf.errorMsg.text = "Invalid email/password"
                return
            }
            //Transition to home screen if user, password correct
            strongSelf.performSegue(withIdentifier: "goToHomeScreen", sender: strongSelf)
        })
    }
}
