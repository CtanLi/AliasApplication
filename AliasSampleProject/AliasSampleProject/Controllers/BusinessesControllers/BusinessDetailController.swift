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
    var getDetailsObject: Business!
    
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
        navigationItem.title = getDetailsObject.name
        businessDetailImage.loadImageUsingCacheWithURLString(urlString: getDetailsObject.imageURL)
        businessDetailLocation.text = "\(getDetailsObject.country + ", " + getDetailsObject.state + " " + getDetailsObject.city)"
        busineesDetailPhone.text = getDetailsObject.phone
        businessDetailStarRating.text = "\(getDetailsObject.rating)"
        businessDetailReviewCount.text = "\(getDetailsObject.reviewCount)"
        businessStatus.text = String(describing: getDetailsObject.isClosed)
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
