//
//  restaurantStruct.swift
//  TuffyFood
//
//  Created by csuftitan on 2/22/22.
//

import Foundation

class restaurant {
    var title: String
    var hours: String
    var location: String
    var priceRating: String
    
    init(name title: String, time hours: String, place location: String, price priceRating: String) {
        self.title = title
        self.hours = hours
        self.location = location
        self.priceRating = priceRating
    }
    var allInfo: String{
        return "\(title)'s hours are \(hours), and they can be found at \(location) with the price rating of \(priceRating) out of $$$"
    }
    func titlePrint(){
        print("\(title)")
    }
    func hoursPrint(){
        print("\(hours)")
    }
    func locationPrint(){
        print("\(location)")
    }
    func priceRatingPrint(){
        print("\(priceRating)")
    }
}
