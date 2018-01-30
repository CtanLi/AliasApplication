//
//  TabBarController.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-30.
//  Copyright © 2018 stan. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class TabBarController: UITabBarController {

    //
    // MARK:- overrides
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // init view
        selectedIndex = TabBarItem.restaurants.rawValue
        initTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK:- implementations
    //
    
    private func initTabBar() {
        tabBar.barTintColor = UIColor(hexString: "#FFFFFF")
        tabBar.tintColor = UIColor(hexString: "#c21500")
        
        let imgRestaurantsBlack = UIImage.init(icon: .FACutlery, size: CGSize(width: 40, height: 40), textColor: .gray, backgroundColor: .clear)
        let imgRestaurantsRed = UIImage.init(icon: .FACutlery, size: CGSize(width: 40, height: 40), textColor: .gray, backgroundColor: .clear)
        
        let imggroceryStoresBlack = UIImage.init(icon: .FAApple, size: CGSize(width: 35, height: 35), textColor: .gray, backgroundColor: .clear)
        let imgRroceryStoresRed = UIImage.init(icon: .FAApple, size: CGSize(width: 35, height: 35), textColor: .gray, backgroundColor: .clear)
        
        (tabBar.items![0] as UITabBarItem).selectedImage = imgRestaurantsRed
        (tabBar.items![0] as UITabBarItem).image = imgRestaurantsBlack
        
        (tabBar.items![1] as UITabBarItem).selectedImage = imgRroceryStoresRed
        (tabBar.items![1] as UITabBarItem).image = imggroceryStoresBlack
    }
    
    enum TabBarItem: Int {
        case restaurants
        case groceryStores
    }
}
