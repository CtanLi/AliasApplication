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
    
    func searchWithParams(_ parameters: [String : AnyObject], completion: @escaping ([Business]) -> Void) {
        getRequestValues(parameters, completion: completion)
    }
    
    func getRequestValues(_ parameters: [String : AnyObject], completion: @escaping ([Business]) -> ()) {
        let httpHeaders: HTTPHeaders = ["Authorization": "Bearer \(GlobalConstants.Constants.apiKey)"]
        Alamofire.request(GlobalConstants.Constants.apiUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: httpHeaders).responseJSON { (responseObject) in
            if responseObject.result.isSuccess {
                let response = JSON(responseObject.result.value ?? "")
                //success(resJson)
                let dictionaries = response["businesses"].arrayObject
                if dictionaries != nil {
                    completion(Business.businesses(array: dictionaries as! [NSDictionary]))
                }
            }
            if responseObject.result.isFailure {
                let error = responseObject.result.error! as NSError
                print("Request failed with error: \(error.description)")
            }
        }
    }
}

