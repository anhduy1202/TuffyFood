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
    let ref = Database.database().reference().child("foodPlaces")
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Storyboard.homeTitle
        navigationItem.hidesBackButton = true
        
        //Retrieve food places data from Firebase
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let getData = snapshot.value as? [String:Any] {
                    print(getData) //Array of object
                /*To do:
                    Parse the retrieved data to the restaurantClass
                    Use the this data to create TableView to display each places
                 */
                }
        })
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
