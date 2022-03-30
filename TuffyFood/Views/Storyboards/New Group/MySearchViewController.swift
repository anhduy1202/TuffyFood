//
//  SwiftUIView.swift
//  TuffyFood
//
//  Created by csuftitan on 3/23/22.
//
import UIKit
import Foundation

var newResList: [myTestRestaurant] = [myTestRestaurant(name:"Panda", desc:"asian food"), myTestRestaurant(name:"Pieology", desc:"american food"), myTestRestaurant(name:"Sandwich", desc:"american food"), myTestRestaurant(name:"Ramen", desc:"asian food")]

class SearchViewController: UIViewController/*, UITableViewDataSource*/ {
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return newResList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell{
        var cell = UITableViewCell()
        
        let(res) = newResList[indexPath.row]
        
        cell.textLabel?.text = res
        return cell
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        //tableView.dataSource = self
    }
    @IBOutlet var printArray: UITableView!
}
class myTestRestaurant {
    var name: String?// = "Panda Express"
    var openTime: Int?// = 9
    var closeTime: Int?// = 14
    var rates: Int?// = 4
    var desc: String
    
    init (name: String, desc: String){
        self.name = name
        self.desc = desc
    }
}
class restaurantManager {
    var presence: Bool?
    //var restaurantList: [String: String] = ["Panda Express": "Open from 10am to 2pm ; Rated 4/5 ; Asian food", "Carl's Jr.": "Open from 8am to 4pm ; Rated 3/5 ; American food"]
    
    var tempArray: [myTestRestaurant] = []
    
//    var newResList: [myTestRestaurant] = [myTestRestaurant(name:"Panda", desc:"asian food"), myTestRestaurant(name:"Pieology", desc:"american food"), myTestRestaurant(name:"Sandwich", desc:"american food"), myTestRestaurant(name:"Ramen", desc:"asian food")]
    
    func addToList(newName: String, description: String){
        //newResList.append(myTestRestaurant(name: newName, desc: description))
        newResList.append(myTestRestaurant(name: newName, desc: description))
        //restaurantList.append(newResList)
    }
    
    @IBOutlet var RestaurantPrintTextBox: UITextField!
    @IBAction func TextBox(_ sender: UITextField) {
        print(newResList)
    }
    @IBOutlet var PrintArray: UITableView!
    
    func searchList(nameToFind: String)->[myTestRestaurant]{
        //var listSize: Int  = restaurantList.count
        
        for i in newResList {
            if nameToFind == i.name{
                presence = true
                tempArray.append(i)
            }
            else {
                presence = false
            }
        }
        return tempArray
    }
}




