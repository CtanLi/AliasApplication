//
//  GlobalConstants.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-30.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation

class GlobalConstants: NSObject {
    
    //
    // MARK:- constants
    //
    
    struct Constants {
        static let apiKey = "fsZRCbdTY-nJsUm-x-OpGlPA_ONeZbjB3k3vTBebBMZscmg5tSTN6ApnuCmYGF8o_hSTWx2nWPWfXSu_dKSCTrwrSQQA81CBWGxhBrf72JDH612HDf741GcNoLFvWnYx"
        static let apiUrl = "https://api.yelp.com/v3/businesses/search"
        static let updateLocationFlag = "updateLocationFlag"
        static let errorMessage = "Sorry reservation is unavailable"
        static let dismissError = "Dismiss"
        static let showRestaurantDetails = "showRestaurantDetails"
        static let showGroceryStoresDetails = "showGroceryStoresDetails"
    }
    
    //
    // MARK:- helpers
    //
    
    // local strorage
    static var updateLocationFlag: Bool {
        get {
            return UserDefaults.standard.value(forKey: Constants.updateLocationFlag) as! Bool
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.updateLocationFlag)
        }
    }
}
