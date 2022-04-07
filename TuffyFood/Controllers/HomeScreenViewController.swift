//
//  HomeScreenViewController.swift
//  TuffyFood
//
//  Created by csuftitan on 2/25/22.
//

import UIKit
import FirebaseAuth
import Firebase


//This view controller responsible to display all places
class HomeScreenViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var email: String? //User email
    var foodPlaces: [restaurant] = [] //We'll use this array to display food places
    let ref = Database.database().reference().child("foodPlaces")
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = Constants.Storyboard.homeTitle
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: Constants.Storyboard.foodNibName, bundle: nil), forCellReuseIdentifier: Constants.Storyboard.foodCellId)
        
        //Retrieve food places data from Firebase
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let allFoodPlaces = snapshot.value as? [String:Any] {
                for (key,value) in allFoodPlaces {
                    if let foodPlace = value as? [String:Any] {
                        
                        //Create new object and append it to array
                        let newFoodPlaces = restaurant(name: key , time: foodPlace["time"]! as! String, place: foodPlace["place"]! as! String, price: foodPlace["price"]! as! String, image: foodPlace["image"]! as! String, rating: foodPlace["rating"]! as! Int)
                        self.foodPlaces.append(newFoodPlaces)
                        
                        //Fetch the main thread
                        DispatchQueue.main.async {
                            //Update data
                            self.tableView.reloadData()
                        }
                    }
                }
                }
        })
    }
    @IBOutlet weak var profileButton: UITabBarItem!
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError {
            print("Error signing out", signOutError)
        }
    }
}

//Displaying food places in UITalbleView
extension HomeScreenViewController: UITableViewDataSource {
    
    //Determine cell row by length of foodPlaces array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodPlaces.count
    }
    //What each cell contains
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Storyboard.foodCellId, for: indexPath) as! foodPlaceCell
        
        //Loading image from URL
        let imageUrl = foodPlaces[indexPath.row].image ?? ""
        guard let url = URL(string: imageUrl) else {return cell}
        URLSession.shared.dataTask(with: url) {(data,ressponse,error) in
            if error != nil {
                print("Failed loading image")
                return
            }
            guard let response = ressponse as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error http response")
                return
            }
            
            //Fetch the main thread
            DispatchQueue.main.async {
                cell.placeImage.image = UIImage(data: data!)
            }
        }.resume()
        
        //Parse data to cell
        cell.placeTitle.text = foodPlaces[indexPath.row].title
        cell.locationTitle.text = foodPlaces[indexPath.row].location
        cell.ratingTitle.text = "\(foodPlaces[indexPath.row].rating!)/5"
           
        return cell
    }
}

//When user interact with each cell (for food places detail feature)
extension HomeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Constants.Storyboard.detailSegue, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? PlaceDetailViewController,  let indexPath = sender as? IndexPath {
            destinationVC.placeData =  foodPlaces[indexPath.row]
        }
    }
}


