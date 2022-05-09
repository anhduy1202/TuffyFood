//
//  reviewTableViewCell.swift
//  TuffyFood
//
//  Created by csuftitan on 5/8/22.
//

import UIKit

class reviewTableViewCell: UITableViewCell {
    @IBOutlet weak var reviewContent: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var reviewAuthor: UILabel!
    override func awakeFromNib() {
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
