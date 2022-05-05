//
//  User.swift
//  TuffyFood
//
//  Created by csuftitan on 3/9/22.
//

import Foundation
import UIKit

struct User {
    var email: String?
    var password: Any?
    var favorites: [restaurant] = []
    var myReviews: [Reviews] = []
    
    mutating func addFavorites (name: String, place: String, price: String, image: String, rating: String) {
        let restaurant = restaurant(name: name, time: "M→Th: 9:00am-7:00pm / F: 9:00am-2:00pm", place: place, price: price, image: image, rating: rating)
        for (index, rest) in favorites.enumerated() {
            if restaurant.title == rest.title {
                favorites.remove(at: index)
                return
            }
        }
        favorites.append(restaurant)
    }
}
