//
//  restaurantStruct.swift
//  TuffyFood
//
//  Created by csuftitan on 2/22/22.
//

import Foundation

class restaurant {
    var title: String?
    var hours: String?
    var location: String?
    var rating: Int?
    var priceRating: String?
    var image: String?
    
    init(name title: String, time hours: String, place location: String, price priceRating: String, image: String, rating: Int) {
        self.title = title
        self.image = image
        self.hours = hours
        self.location = location
        self.priceRating = priceRating
        self.rating = rating
    }
   
}
