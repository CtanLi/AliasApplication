//
//  Business.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-29.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation

class Business: NSObject {
    
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
    
    class func businesses(array: [NSDictionary]) -> [Business] {
        var businesses = [Business]()
        for dictionary in array {
            let business = Business(dictionary: dictionary)
            businesses.append(business)
        }
        return businesses
    }
    
    //
    // MARK:- implementations
    //
    
    class func searchWithTerm(parameters: [String : AnyObject], completion: @escaping ([Business]) -> Void) {
        YelpApiManager.sharedUInstance.searchWithTerm(parameters, completion: completion)
    }
}
