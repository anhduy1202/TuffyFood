//
//  registerViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/6/22.
//

import UIKit
import FirebaseAuth

class registerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
   
    @IBOutlet weak var errorMsg: UILabel!
    @IBAction func registerPressed(_ sender: UIButton) {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            self.errorMsg.text = "Missing field data"
            return
    }
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else {
                //Error handling
                strongSelf.errorMsg.text="Something went wrong :("
                return
            }
            //Transition to home screen after creating account
            strongSelf.performSegue(withIdentifier: Constants.Storyboard.loginSegue, sender: strongSelf)
        })
    }
    
}
