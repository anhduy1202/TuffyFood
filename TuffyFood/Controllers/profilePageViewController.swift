//
//  profilePageViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/24/22.
//

import Foundation
import UIKit

class profilePageViewController: UIViewController {
    var logInVC: HomeScreenViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        logInVC = self.tabBarController!.viewControllers?[0] as? HomeScreenViewController
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    func updateUI () {
        profileName.text = member1.name
        yearLabel.text = "Year: \(member1.year)"
        if logInVC.user.email != nil {
            emailLabel.text = "Email: \(String(describing: logInVC.user.email))"
        }
        emailLabel.text = "Email: N/A"
        print(logInVC.user.myReviews)
        reviewsLabel.text = "Reviews: \(String(logInVC.user.myReviews.count))"
    }
    
    
}
