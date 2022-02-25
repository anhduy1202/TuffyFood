//
//  AuthController.swift
//  TuffyFood
//
//  Created by csuftitan on 2/22/22.
//

import UIKit
import FirebaseAuth

//This view controller is responsible for sign in/ sign up
class AuthController: UIViewController {
    
    private let label:UILabel =
    {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField:UITextField =
    {
        let emailField = UITextField()
        emailField.placeholder = "Email"
        emailField.layer.borderWidth = 1
        emailField.backgroundColor = .white
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x:0, y:0, width: 5, height:0))
        emailField.autocapitalizationType = .none
        emailField.layer.borderColor = UIColor.black.cgColor
        return emailField
    }()
    
    private let passwordField:UITextField =
    {
        let passField = UITextField()
        passField.placeholder = "Password"
        passField.layer.borderWidth = 1
        passField.isSecureTextEntry = true
        passField.backgroundColor = .white
        passField.leftViewMode = .always
        passField.leftView = UIView(frame: CGRect(x:0, y:0, width: 5, height:0))
        passField.layer.borderColor = UIColor.black.cgColor
        return passField
    }()
    
    private let button:UIButton =
    {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
    }()
    
    private let signOutButton:UIButton =
    {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log out", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Adding subviews
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //Display homescreen for logged in user
        if FirebaseAuth.Auth.auth().currentUser != nil {
            self.transitionToHome()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x:0,y:100,width: view.frame.size.width, height: 80)
        emailField.frame = CGRect(x:20,y:label.frame.origin.y+label.frame.size.height+10,width: view.frame.size.width-40, height: 50)
        passwordField.frame = CGRect(x:20,y:emailField.frame.origin.y+emailField.frame.size.height+10,width:view.frame.size.width-40 , height: 50)
        button.frame = CGRect(x:20,y:passwordField.frame.origin.y+passwordField.frame.size.height+10,width: view.frame.size.width-40, height: 50)
    }
    
    //Automatically popup keyboard
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }
    
    //Submit login form
    @objc private func didTapButton(){
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        
      //Log in through Firebase
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            //Create account if user not exist
            guard error == nil else {
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            //Transition to home screen if user, password correct
            strongSelf.transitionToHome()
        })
    }
    
    //Pop-up for create account prompt
    func showCreateAccount(email:String, password:String) {
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account? ", preferredStyle: .alert)
        
        //Create account if user choose "Continue"
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            
            //Create account
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
                guard let strongSelf = self else {
                    return
                }
                guard error == nil else {
                    //Error handling
                    print("Something went wrong :(")
                    return
                }
                //Transition to home screen after creating account
                strongSelf.transitionToHome()
            })
        }))
        
        //Nothing happen if user choose "Cancel"
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
            
        }))
        present(alert,animated: true)
    }
    
    func transitionToHome() {
        
        let homeViewController =  storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeScreenViewController) as? HomeScreenViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}

