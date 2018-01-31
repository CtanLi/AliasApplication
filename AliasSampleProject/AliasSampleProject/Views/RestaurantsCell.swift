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
    var restaurants: Restaurants! {
        didSet {
            restaurantImage.loadImageUsingCacheWithURLString(urlString: restaurants.imageURL)
            restaurantName.text = restaurants.name
            restaurantLocation.text = "\(restaurants.country + ", " + restaurants.state + " " + restaurants.city)"
            restaurantPhone.text = restaurants.phone
            restaurantRating.text = "\(restaurants.rating)"
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
