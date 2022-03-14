//
//  welcomeViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/6/22.
//

import UIKit

class welcomeViewController: UIViewController {

    @IBOutlet weak var tuffyLabel: UILabel!
    @IBAction func registerPressed(_ sender: UIButton) {
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        tuffyLabel.text = ""
        var charIdx = 0.0
        let title = Constants.Storyboard.tuffyFood
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIdx, repeats: false) { timer in
                self.tuffyLabel.text?.append(letter)
            }
            charIdx+=1
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
