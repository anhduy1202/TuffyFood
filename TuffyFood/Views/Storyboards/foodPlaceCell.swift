//
//  foodPlaceCell.swift
//  TuffyFood
//
//  Created by csuftitan on 3/13/22.
//

import UIKit

class foodPlaceCell: UITableViewCell {
    var logInVC: HomeScreenViewController!
 
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var ratingTitle: UILabel!
    @IBOutlet weak var placeImage: UIImageView!

    @IBAction func addToFavorite(_ sender: Any) {
        print(placeTitle.text!)
//        let restaurant = restaurant(name: placeTitle.text!, time:"M→Th: 9:00am-7:00pm / F: 9:00am-2:00pm", place: locationTitle.text!, price:"$$",image:"",rating: ratingTitle.text!)
        logInVC.user.addFavorites(name: placeTitle.text!, place: locationTitle.text!, price: "$$", image: "", rating: ratingTitle.text!)
        logInVC.updateFavorites()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
