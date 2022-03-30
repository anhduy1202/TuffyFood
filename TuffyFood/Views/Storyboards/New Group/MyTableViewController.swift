//
//  MyTableViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/23/22.
//

import UIKit

class MyTableViewController: UITableViewController {

    //var mobilelist=[[String: Any]]()
    var newRestaurantList: [myTestRestaurant] = [myTestRestaurant(name:"Panda", desc:"asian food"), myTestRestaurant(name:"Pieology", desc:"american food"), myTestRestaurant(name:"Sandwich", desc:"american food"), myTestRestaurant(name:"Ramen", desc:"asian food")]// = ["Panda Express": "Open from 10am to 2pm ; Rated 4/5 ; Asian food", "Carl's Jr.": "Open from 8am to 4pm ; Rated 3/5 ; American food"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world")
        //mobilelist.append(["Mobile Name: ": "iPhone6s", "Price: ": 15000])
        
        //newRestaurantList.append()
//        newRestaurantList.append(["Carl's Jr.": "Open from 8am to 4pm ; Rated 3/5 ; American food"])
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newRestaurantList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        print(newRestaurantList[indexPath.row])
        print(newRestaurantList)
        let cell:UITableViewCell?=tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text=newRestaurantList[indexPath.row].name
        cell?.detailTextLabel?.text=newRestaurantList[indexPath.row].desc
        
        //newRestaurantList.reloadData()
        return cell!
    }
    var filteredData: [myTestRestaurant] = []
    //attempt 1
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
//        filteredData = newRestaurantList
//        if searchText.isEmpty == false {
//            filteredData = newRestaurantList.filter({$0.contains(searchText)})
//        }
//    }
    
    //attempt 2
//    func searcher(_ searchBar: UISearchBar, textDidChance searchText: String){
//        filterContentForSearchText(searchText: searchText)
//    }
//    func filterContent(searchText: String, scope: String = "ALL"){
//        if searchText != ""{
//            filteredData = newRestaurantList.filter{
//                name in
//                return name.lowercased().contains(searchText.lowercased())
//            }
//        } else {
//            self.filteredData = self.data
//        }
//    }
}


