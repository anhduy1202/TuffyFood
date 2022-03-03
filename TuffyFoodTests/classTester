//
//  testRestaurantClass.swift
//  TuffyFood
//
//  Created by csuftitan on 2/24/22.
//

import Foundation
import XCTest
@testable import TuffyFood


class testRestaurants: XCTestCase{
    override func setUpWithError() throws{
        
    }
    override func tearDownWithError() throws{
        
    }
    func testAllInfo(){
        let restaurantVar = restaurant(name:"Carl's Jr", time:"M→Th: 8:00am-5:00pm / F: 8:00am-2:00pm", place:"Outside Gordon Hall", price:"$$")
        XCTAssertEqual(restaurantVar.allInfo, "Carl's Jr's hours are M→Th: 8:00am-5:00pm / F: 8:00am-2:00pm, and they can be found at Outside Gordon Hall with the price rating of $$ out of $$$")
    }
    func testTitlePrint(){
        let restaurantVar = restaurant(name:"Carl's Jr", time:"M→Th: 8:00am-5:00pm / F: 8:00am-2:00pm", place:"Outside Gordon Hall", price:"$$")
        XCTAssertEqual(restaurantVar.title, "Carl's Jr")
    }
    func testHoursPrint(){
        let restaurantVar = restaurant(name:"Carl's Jr", time:"M→Th: 8:00am-5:00pm / F: 8:00am-2:00pm", place:"Outside Gordon Hall", price:"$$")
        XCTAssertEqual(restaurantVar.hours, "M→Th: 8:00am-5:00pm / F: 8:00am-2:00pm")
    }
    func testLocationPrint(){
        let restaurantVar = restaurant(name:"Carl's Jr", time:"M→Th: 8:00am-5:00pm / F: 8:00am-2:00pm", place:"Outside Gordon Hall", price:"$$")
        XCTAssertEqual(restaurantVar.location, "Outside Gordon Hall")
    }
    func testPriceRatingPrint(){
        let restaurantVar = restaurant(name:"Carl's Jr", time:"M→Th: 8:00am-5:00pm / F: 8:00am-2:00pm", place:"Outside Gordon Hall", price:"$$")
        XCTAssertEqual(restaurantVar.priceRating, "$$")
    }
}
