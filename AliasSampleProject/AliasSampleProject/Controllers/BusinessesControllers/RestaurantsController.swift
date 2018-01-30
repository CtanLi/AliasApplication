//
//  ViewController.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-29.
//  Copyright © 2018 stan. All rights reserved.
//

import UIKit

class RestaurantsController: UIViewController, UpdateLocationDelegate, UITableViewDelegate, UITableViewDataSource {

    //
    // MARK:- properties
    //
    
    // vars
    private let location = LocationMonitor.SharedManager
    var selectedCellObject: Business!
    var businesses = [Business]() {
        didSet {
            restaurantTable.reloadData()
        }
    }
    
    // views
    @IBOutlet weak var restaurantTable: UITableView!

    //
    // MARK:- overrides
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
        restaurantTable.delegate = self
        restaurantTable.dataSource = self
        businesses.removeAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK:- implementations
    //
    
    // get user current Location and make api call
    func updateLocation() {
        let userCurrentLocation = ("\(location.currentLocation?.coordinate.latitude ?? 0), \(location.currentLocation?.coordinate.longitude ?? 0)")
        let parameters: [String : AnyObject] = ["term": "Restaurants" as AnyObject, "location": userCurrentLocation as AnyObject]
        Business.searchWithTerm(parameters: parameters, completion: { (businesses: [Business]?) -> Void in
            self.businesses = businesses!
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantsCell.identifier, for: indexPath)
            as! RestaurantsCell
        cell.business = businesses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RestaurantsCell
        selectedCellObject = cell.business
        self.performSegue(withIdentifier: GlobalConstants.Constants.showRestaurantDetails, sender: self)
    }
    
    //
    // MARK:- operations
    //
    
    // pass data using segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == GlobalConstants.Constants.showRestaurantDetails) {
            let detailVC = segue.destination as? BusinessDetailController
            detailVC?.getDetailsObject = selectedCellObject
        }
    }
}

