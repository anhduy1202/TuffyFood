//
//  HomeScreenViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 2/25/22.
//

import UIKit
import FirebaseAuth
import Firebase

//This view controller responsible to display all places
class HomeScreenViewController: UIViewController {
    var email: String? //User email
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        
        title = Constants.Storyboard.homeTitle
        navigationItem.hidesBackButton = true
    }
    @IBOutlet weak var profileButton: UITabBarItem!
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError {
            print("Error signing out", signOutError)
        }
    }
}
