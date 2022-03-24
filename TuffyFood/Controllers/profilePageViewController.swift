//
//  profilePageViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/24/22.
//

import Foundation
import UIKit

class profilePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func updateUI () {
        profileName.text = member1.name
        yearLabel.text = "Year: \(member1.year)"
//        emailLabel.text = User.email
    }
    
    
}
