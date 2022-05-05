//
//  favoritesPageViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/24/22.
//

import UIKit

class favoritesPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var logInVC: HomeScreenViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        logInVC = self.tabBarController!.viewControllers?[0] as? HomeScreenViewController
        self.favoritesTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logInVC.user.favorites.count
    }
    
    // Sets the value of each cell to each restaurant in the logInVC.user.favorites dictionary
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell", for: indexPath)
        cell.textLabel?.text = logInVC.user.favorites[indexPath.row].title
        
        return cell
    }
    
}
