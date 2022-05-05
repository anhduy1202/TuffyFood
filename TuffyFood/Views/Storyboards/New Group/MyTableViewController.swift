//
//  MyTableViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/23/22.
//

import UIKit

class MyTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        print("uwu?")
    }
    @IBOutlet var searcher: UISearchBar!
    
    var segueTracker: myTestRestaurant!
    var newRestaurantList: [myTestRestaurant]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searcher.delegate = self
        
        print("Hello world")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        print(filteredData[indexPath.row])
        print(filteredData)
        let cell:UITableViewCell?=tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text=filteredData[indexPath.row].name
            cell?.detailTextLabel?.text=filteredData[indexPath.row].desc
        return cell!
    }
    var filteredData: [myTestRestaurant] = newResList
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText == "" || searchText == " " {
            print("There is nothing in the search bar")
            filteredData = newRestaurantList!
            tableView.reloadData()
        }
        else {
            filteredData.removeAll()
            for restaurant in newRestaurantList! {
                if searchText != restaurant.name {
                    print("There is nothing that matches")
                }
                if searchText == restaurant.name {//use prefix and $0.lowercase
                    filteredData.append(restaurant)
                }
            }
            tableView.reloadData()
        }
    }
    @IBOutlet var tbl: UITableView!
    @IBOutlet var searchBar: UISearchBar!
}

func addToList(newName: String, description: String){
    let newAddition = myTestRestaurant(name: newName, desc: description)
    newResList.append(newAddition)
}
