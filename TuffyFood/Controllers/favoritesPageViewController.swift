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
        addFavorite()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    var CBEStarbucks = restaurant(name:"CBE Starbucks", time:"M→Th: 7:30am-7:00pm / F: 7:30am-4:00pm", place:"College of Business and Economics", price:"$$$",image:"",rating:5)
    
    var HibachiSan = restaurant(name:"Hibachi San", time:"M→Th: 10:00am-5:00pm / F: 10:00am-2:00pm", place:"TSU", price:"$$",image:"",rating:5)
    
    var PandaExpress = restaurant(name:"Panda Express", time:"M→Th: 9:00am-7:00pm / F: 9:00am-2:00pm", place:"TSU", price:"$$",image:"",rating:5)
    
    func addFavorite() {
        logInVC.user.favorites[0] = PandaExpress
        logInVC.user.favorites[1] = CBEStarbucks
        logInVC.user.favorites[2] = HibachiSan
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logInVC.user.favorites.count
    }
    
    // Sets the value of each cell to each restaurant in the logInVC.user.favorites dictionary
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell", for: indexPath)
        cell.textLabel?.text = logInVC.user.favorites[indexPath.row]?.title
        return cell
    }
    
}
