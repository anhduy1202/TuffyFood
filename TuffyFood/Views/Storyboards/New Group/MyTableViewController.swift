//
//  MyTableViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 3/23/22.
//

import UIKit

class MyTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        print("xcode stinky!!!!! CRINGE!!!!!!!")
    }
    

    //Attempt 4
//     This is for attempt 4
//      https://www.appcoda.com/custom-search-bar-tutorial/
//    var searchController: UISearchController!
//    func configureSearchController() {
//        // Initialize and perform a minimum configuration to the search controller.
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Search here..."
//        searchController.searchBar.delegate = self
//        searchController.searchBar.sizeToFit()
//
//        // Place the search bar view to the tableview headerview.
//        tblSearchResults.tableHeaderView = searchController.searchBar
//    }
    //End of Attempt 4
    
    //var mobilelist=[[String: Any]]()
    //var newRestaurantList: [myTestRestaurant] = [myTestRestaurant(name:"Panda", desc:"asian food"), myTestRestaurant(name:"Pieology", desc:"american food"), myTestRestaurant(name:"Sandwich", desc:"american food"), myTestRestaurant(name:"Ramen", desc:"asian food")]// = ["Panda Express": "Open from 10am to 2pm ; Rated 4/5 ; Asian food", "Carl's Jr.": "Open from 8am to 4pm ; Rated 3/5 ; American food"]
    var segueTracker: myTestRestaurant!
    var newRestaurantList: [myTestRestaurant]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //attempt 5 starts here
//        let nib = UINib(nibName: "TableCell", bundle: nil)
//           tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
//
//           resultsTableController =
//               self.storyboard?.instantiateViewController(withIdentifier: "ResultsTableController") as? ResultsTableController
//           // This view controller is interested in table view row selections.
//           resultsTableController.tableView.delegate = self
//
//           searchController = UISearchController(searchResultsController: resultsTableController)
//           searchController.delegate = self
//           searchController.searchResultsUpdater = self
//           searchController.searchBar.autocapitalizationType = .none
//           searchController.searchBar.delegate = self // Monitor when the search button is tapped.
//
//           searchController.searchBar.scopeButtonTitles = [Product.productTypeName(forType: .all),
//                                                           Product.productTypeName(forType: .birthdays),
//                                                           Product.productTypeName(forType: .weddings),
//                                                           Product.productTypeName(forType: .funerals)]
//
//           // Place the search bar in the navigation bar.
//           navigationItem.searchController = searchController
//
//           // Make the search bar always visible.
//           navigationItem.hidesSearchBarWhenScrolling = false
//
//           /** Search presents a view controller by applying normal view controller presentation semantics.
//               This means that the presentation moves up the view controller hierarchy until it finds the root
//               view controller or one that defines a presentation context.
//           */
//
//           /** Specify that this view controller determines how the search controller is presented.
//               The search controller should be presented modally and match the physical size of this view controller.
//           */
//           definesPresentationContext = true
//
//           setupDataSource()
//       }
        //attempt 5 ends here
        
        //attempt 6 continue here
//        tbl.delegate = self
//        tbl.dataSource = self
//        searchBar.delegate = self
        
        
        //attempt 6 continue ends here
        
        
        
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
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        print(filteredData[indexPath.row])
        print(filteredData)
        let cell:UITableViewCell?=tableView.dequeueReusableCell(withIdentifier: "cell")
        //cell?.textLabel?.text=newRestaurantList[indexPath.row].name
        //cell?.detailTextLabel?.text=newRestaurantList[indexPath.row].desc
        
        //from 120 to 122, you are checking if og array is nil or not; if not empty, you are grabbing element on the prodivded index
       // if let list=filteredData{
            cell?.textLabel?.text=filteredData[indexPath.row].name
            cell?.detailTextLabel?.text=filteredData[indexPath.row].desc
        //}
        
        
        //newRestaurantList.reloadData()
        return cell!
    }
    //var filteredData: [myTestRestaurant] = []
    var filteredData: [myTestRestaurant] = newResList
    //var simp: [myTestRestaurant] = newResList
    //attempt 1
    //psuedo code
    /*
     print if nothing is in search bar
     print if nothing matches
     append if the restauraent searched for is found
     bool stuff to show if search bar is being used or not?
     
     show table if search bar hasnt been used
     filter table if search bar is used and full name of restaurant isnt given, like if you type in "in" when the restaurants in the list are "burger king", "in n out", "mcdonalds", etc
     
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
//        if filteredData.count == 0 {
//            return
//        }
        print("WAKANDA FOREVA MY BRODAS")
        if searchText == "" || searchText == " " {
            print("There is nothing in the search bar")
            filteredData = newRestaurantList!
        }
        else {
            for restaurant in newRestaurantList! {
                if searchText != restaurant.name {
                    print("There is nothing that matches")
                }
                if searchText == restaurant.name {
                    filteredData.append(restaurant)
                    //self.filteredData.filt
                }
            }
            print("MEWOMEWOMWEOWMEOWMEWOMEWOEMWOMEWOMEWOMEWOE")
            print(filteredData)
            print("UWUWUWUWUWUWUWUWUWUUWUWUWUWUUWUWUWUWUUWUWUWUWUUW")
            tableView.reloadData()
        }
        //filteredData = newRestaurantList!//this is here because we want the filtered data to be populated at least
//        if searchText.isEmpty == false {
//            filteredData = newRestaurantList.filter({$0.contains(searchText)})
//        }
    }
    
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
    
    //attempt 6 start
    @IBOutlet var tbl: UITableView!
    @IBOutlet var searchBar: UISearchBar!


    //attempt 6 end
    
    
    
}


    //attempt 3 - https://stackoverflow.com/questions/47095722/how-to-search-for-object-in-dictionary-with-searchbar-tableview
//var filteredData: [myTestRestaurant] = []
//
//func updateSearchResults(for searchController: UISearchController){
//    if searchController.searchBar.text! == "" {
//        filteredData = newResList
//    } else {
//        filteredData.removeAll()
//
//        var newDictionary = [String]()
//
//        for (_, value) in newResList {
//            newDictionary += value
//        }
//
//        let newFilteredDictionary = newDictionary.filter{$0.getName().lowercased().contains(searchController.searchBar.text!.lowercased())}
//        for filtered in newFilteredDictionary {
//            if let letter = filtered.getName().characters.first {
//                if filteredData[String(]
//            }
//        }
//    }
//}

func addToList(newName: String, description: String){
    let newAddition = myTestRestaurant(name: newName, desc: description)
    newResList.append(newAddition)
}
