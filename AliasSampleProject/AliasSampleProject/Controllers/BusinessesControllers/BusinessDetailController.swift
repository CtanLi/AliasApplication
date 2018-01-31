//
//  BusinessDetailController.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-30.
//  Copyright © 2018 stan. All rights reserved.
//

import UIKit

class BusinessDetailController: UIViewController {

    //
    // MARK:- properties
    //
    
    // vars
    var getGroceryStoresDetails: GroceryStores!
    var getRestaurantDetails: Restaurants!
    
    @IBOutlet weak var businessDetailImage: UIImageView! {
        didSet{
            businessDetailImage.layer.cornerRadius = businessDetailImage.frame.size.height/2
            businessDetailImage.clipsToBounds = true
            businessDetailImage.layer.borderWidth = 1.0
        }
    }
    
    // views
    @IBOutlet weak var businessDetailLocation: UILabel!
    @IBOutlet weak var busineesDetailPhone: UILabel!
    @IBOutlet weak var businessDetailStarRating: UILabel!
    @IBOutlet weak var businessDetailReviewCount: UILabel!
    @IBOutlet weak var businessDetailStatus: UILabel!
    @IBOutlet weak var businessStatus: UILabel!
    
    //
    // MARK:- overrides
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDtailPageWithBusinessObjects()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK:- implementations
    //
    
    func updateDtailPageWithBusinessObjects() {
        getRestaurantDetails != nil ? (navigationItem.title = getRestaurantDetails.name) : (navigationItem.title = getGroceryStoresDetails.name)
        getRestaurantDetails != nil ? (businessDetailImage.loadImageUsingCacheWithURLString(urlString: getRestaurantDetails.imageURL)) :
        (businessDetailImage.loadImageUsingCacheWithURLString(urlString: getGroceryStoresDetails.imageURL))
        getRestaurantDetails != nil ? (businessDetailLocation.text = "\(getRestaurantDetails.country + ", " + getRestaurantDetails.state + " " + getRestaurantDetails.city)") :
        (businessDetailLocation.text = "\(getGroceryStoresDetails.country + ", " + getGroceryStoresDetails.state + " " + getGroceryStoresDetails.city)")
        getRestaurantDetails != nil ? (busineesDetailPhone.text = getRestaurantDetails.phone) : (busineesDetailPhone.text = getGroceryStoresDetails.phone)
        getRestaurantDetails != nil ? (businessDetailStarRating.text = "\(getRestaurantDetails.rating)") : (businessDetailStarRating.text = "\(getGroceryStoresDetails.rating)")
        getRestaurantDetails != nil ? (businessDetailReviewCount.text = "\(getRestaurantDetails.reviewCount)") : (businessDetailReviewCount.text = "\(getGroceryStoresDetails.reviewCount)")
        getRestaurantDetails != nil ? (businessStatus.text = String(describing: getRestaurantDetails.isClosed)) : (businessStatus.text = String(describing: getGroceryStoresDetails.isClosed))
    }
    
    //
    // MARK:- operations
    //
    
    @IBAction func businessReservationAction(_ sender: Any) {
        let alertController = UIAlertController(title: GlobalConstants.Constants.errorMessage,
                                                message: nil,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: GlobalConstants.Constants.dismissError, style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
