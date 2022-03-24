//
//  User.swift
//  TuffyFood
//
//  Created by csuftitan on 3/9/22.
//

import Foundation

struct User {
    var email: String?
    var password: Any?
    var favorites: [Int:restaurant] = [:]
    var myReviews: [Int:Reviews] = [:]
}
