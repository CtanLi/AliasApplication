//
//  RestaurantsCell.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-30.
//  Copyright © 2018 stan. All rights reserved.
//

import UIKit

class RestaurantsCell: UITableViewCell, Reusable {

    //
    // MARK:- properties
    //
    
    // views
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantLocation: UILabel!
    @IBOutlet weak var restaurantPhone: UILabel!
    @IBOutlet weak var restaurantRating: UILabel!

    // data
    var business: Business! {
        didSet {
            restaurantImage.loadImageUsingCacheWithURLString(urlString: business.imageURL)
            restaurantName.text = business.name
            restaurantLocation.text = "\(business.country + ", " + business.state + " " + business.city)"
            restaurantPhone.text = business.phone
            restaurantRating.text = "\(business.rating)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        restaurantImage.layer.cornerRadius = restaurantImage.frame.size.height/2
        restaurantImage.clipsToBounds = true
        restaurantImage.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
