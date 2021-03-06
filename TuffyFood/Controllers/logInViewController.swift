//
//  logInViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/6/22.
//

import UIKit
import FirebaseAuth


class logInViewController: UIViewController {
    var user = User()
    
    var newRestaurantList: [myTestRestaurant] = [myTestRestaurant(name:"Panda", desc:"asian food"), myTestRestaurant(name:"Pieology", desc:"american food"), myTestRestaurant(name:"Sandwich", desc:"american food"), myTestRestaurant(name:"Ramen", desc:"asian food")]
    
    var segueTracker: myTestRestaurant!
    
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
            strongSelf.performSegue(withIdentifier: Constants.Storyboard.authSegue, sender: strongSelf)
        })
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        user.email = emailField.text
        if segue.identifier == Constants.Storyboard.authSegue {
            let destinationVC = segue.destination as! HomeScreenViewController
            print(user.email!)
            destinationVC.email = user.email!
        }
        //hehexd this next part needed for nick's stuff hehexd
        //no touchy touchy
        else if let addSegue = segue.destination as? MyTableViewController {
            
            addSegue.segueTracker = segueTracker
            addSegue.newRestaurantList = newRestaurantList
        }
    }
}
