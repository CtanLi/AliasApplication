//
//  GroceryStoresController.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-30.
//  Copyright © 2018 stan. All rights reserved.
//

import UIKit

class GroceryStoresController: UIViewController, UITableViewDelegate, UITableViewDataSource, UpdateLocationDelegate {

    //
    // MARK:- properties
    //
    
    // vars
    private let location = LocationMonitor.SharedManager
    var selectedCellObject: GroceryStores!
    var groceryStores = [GroceryStores]() {
        didSet {
            groceryStoreTable.reloadData()
        }
    }

    // views
    @IBOutlet weak var groceryStoreTable: UITableView!
    
    //
    // MARK:- overrides
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalConstants.updateLocationFlag = false
        location.startMonitoring()
        location.delegate = self
        groceryStores.removeAll()
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
        print("locations = \(location.currentLocation?.coordinate.latitude ?? 0), \(location.currentLocation?.coordinate.longitude ?? 0)")
        let userCurrentLocation = ("\(location.currentLocation?.coordinate.latitude ?? 0), \(location.currentLocation?.coordinate.longitude ?? 0)")
        let parameters: [String : AnyObject] = ["term": "GroceryStores" as AnyObject, "location": userCurrentLocation as AnyObject]
        GroceryStores.searchWithGroceryStoresParams(parameters: parameters, completion: { (businesses: [GroceryStores]?) -> Void in
              self.groceryStores = businesses!
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryStores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroceryStoresCell.identifier, for: indexPath)
            as! GroceryStoresCell
        cell.groceryStores = groceryStores[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! GroceryStoresCell
        selectedCellObject = cell.groceryStores
        self.performSegue(withIdentifier: GlobalConstants.Constants.showGroceryStoresDetails, sender: self)
    }
    
    //
    // MARK:- operations
    //
    
    // pass data using segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == GlobalConstants.Constants.showGroceryStoresDetails) {
            let detailVC = segue.destination as? BusinessDetailController
            detailVC?.getGroceryStoresDetails = selectedCellObject
        }
    }
}
