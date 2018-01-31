//
//  ApiManager.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-29.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class YelpApiManager: NSObject {
    
    static let sharedInstance = YelpApiManager()
    
    //
    // MARK:- implementations
    //
    
    // restaurants api call
    func searchWithRestaurantsParams(_ parameters: [String : AnyObject], completion: @escaping ([Restaurants]) -> Void) {
        getRestaurantsValues(parameters, completion: completion)
    }
    
    func getRestaurantsValues(_ parameters: [String : AnyObject], completion: @escaping ([Restaurants]) -> ()) {
        let httpHeaders: HTTPHeaders = ["Authorization": "Bearer \(GlobalConstants.Constants.apiKey)"]
        Alamofire.request(GlobalConstants.Constants.apiUrl, method: .get,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: httpHeaders).responseJSON { (responseObject) in
            if responseObject.result.isSuccess {
                let response = JSON(responseObject.result.value ?? "")
                //success(resJson)
                let dictionaries = response["businesses"].arrayObject
                if dictionaries != nil {
                    completion(Restaurants.businesses(array: dictionaries as! [NSDictionary]))
                }
            }
            if responseObject.result.isFailure {
                let error = responseObject.result.error! as NSError
                print("Request failed with error: \(error.description)")
            }
        }
    }
    
    // groceryStores api call
    func searchWithGroceryStoresParams(_ parameters: [String : AnyObject], completion: @escaping ([GroceryStores]) -> Void) {
        getGroceryStoresValues(parameters, completion: completion)
    }
    
    func getGroceryStoresValues(_ parameters: [String : AnyObject], completion: @escaping ([GroceryStores]) -> ()) {
        let httpHeaders: HTTPHeaders = ["Authorization": "Bearer \(GlobalConstants.Constants.apiKey)"]
        Alamofire.request(GlobalConstants.Constants.apiUrl, method: .get,
              parameters: parameters,
              encoding: URLEncoding.default,
              headers: httpHeaders).responseJSON { (responseObject) in
                if responseObject.result.isSuccess {
                    let response = JSON(responseObject.result.value ?? "")
                    //success(resJson)
                    let dictionaries = response["businesses"].arrayObject
                    if dictionaries != nil {
                        completion(GroceryStores.businesses(array: dictionaries as! [NSDictionary]))
                    }
                }
                if responseObject.result.isFailure {
                    let error = responseObject.result.error! as NSError
                    print("Request failed with error: \(error.description)")
                }
            }
        }
}

