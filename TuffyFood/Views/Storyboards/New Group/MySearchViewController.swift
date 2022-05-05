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
    
    var tempArray: [myTestRestaurant] = []
    
    func addToList(newName: String, description: String){
        newResList.append(myTestRestaurant(name: newName, desc: description))
    }
    
    @IBOutlet var RestaurantPrintTextBox: UITextField!
    @IBAction func TextBox(_ sender: UITextField) {
        print(newResList)
    }
    @IBOutlet var PrintArray: UITableView!
    
    func searchList(nameToFind: String)->[myTestRestaurant]{
        
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




