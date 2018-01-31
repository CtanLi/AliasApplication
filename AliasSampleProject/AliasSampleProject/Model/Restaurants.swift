//
//  Business.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-29.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation

class Restaurants: NSObject {
    
    //
    // MARK:- properties
    //
    
    @objc var id: String = ""
    @objc var url: String = ""
    @objc var name: String = ""
    @objc var city: String = ""
    @objc var country: String = ""
    @objc var state: String = ""
    @objc var imageURL: String = ""
    @objc var rating: NSNumber = 0
    @objc var distance: String = ""
    @objc var isClosed: Bool = false
    @objc var reviewCount: NSNumber = 0
    @objc var phone: String = ""
    
    //
    // MARK:- creation
    //
    
    init(dictionary: NSDictionary) {
        id = dictionary["id"] as! String
        name = dictionary["name"] as! String
        reviewCount = dictionary["review_count"] as! NSNumber
        url = dictionary["url"] as! String
        rating = dictionary["rating"] as! NSNumber
        phone = dictionary["display_phone"] as! String
        isClosed = dictionary["is_closed"] as! Bool
        
        if let location = dictionary["location"] as? NSDictionary {
            city = location["city"] as! String
            country = location["country"] as! String
            state = location["state"] as! String
        }
        let imageURLString = dictionary["image_url"] as! String
            imageURL = imageURLString
        }
    
    class func businesses(array: [NSDictionary]) -> [Restaurants] {
        var restaurants = [Restaurants]()
        for dictionary in array {
            let store = Restaurants(dictionary: dictionary)
            restaurants.append(store)
        }
        return restaurants
    }
    
    //
    // MARK:- implementations
    //
    
    class func searchWithRestaurantsParams(parameters: [String : AnyObject], completion: @escaping ([Restaurants]) -> Void) {
        YelpApiManager.sharedInstance.searchWithRestaurantsParams(parameters, completion: completion)
    }
}
