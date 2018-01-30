//
//  GroceryStoresCell.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-30.
//  Copyright © 2018 stan. All rights reserved.
//

import UIKit

class GroceryStoresCell: UITableViewCell, Reusable {

    //
    // MARK:- properties
    //
    
    // views
    @IBOutlet weak var groceryStoreImage: UIImageView!
    @IBOutlet weak var groceryStoreName: UILabel!
    @IBOutlet weak var groceryStoreLocation: UILabel!
    @IBOutlet weak var groceryStorePhone: UILabel!
    @IBOutlet weak var groceryStoreRating: UILabel!
    
    // data
    var business: Business! {
        didSet {
            groceryStoreImage.loadImageUsingCacheWithURLString(urlString: business.imageURL)
            groceryStoreName.text = business.name
            groceryStoreLocation.text = "\(business.country + ", " + business.state + " " + business.city)"
            groceryStorePhone.text = business.phone
            groceryStoreRating.text = "\(business.rating)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        groceryStoreImage.layer.cornerRadius = groceryStoreImage.frame.size.height/2
        groceryStoreImage.clipsToBounds = true
        groceryStoreImage.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
