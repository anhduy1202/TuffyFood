//
//  foodPlaceCell.swift
//  TuffyFood
//
//  Created by csuftitan on 3/13/22.
//

import UIKit

class foodPlaceCell: UITableViewCell {

    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var locationTitle: UILabel!
    @IBOutlet weak var ratingTitle: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
