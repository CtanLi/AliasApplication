//
//  LocationMonitor.swift
//  AliasSampleProject
//
//  Created by CtanLI on 2018-01-30.
//  Copyright © 2018 stan. All rights reserved.
//

import CoreLocation

protocol UpdateLocationDelegate {
    func updateLocation()
}

class LocationMonitor: NSObject, CLLocationManagerDelegate {
    
    //
    // MARK: properties
    //
    
    // services
    static let SharedManager = LocationMonitor()
    private let locationManager = CLLocationManager()
    var delegate: UpdateLocationDelegate?
    
    // data
    var currentLocation: CLLocation?
    
    
    //
    // MARK: creation
    //
    
    override init() {
        super.init()
        
        GlobalConstants.updateLocationFlag = false
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            startMonitoring()
        }
    }
    
    
    //
    // MARK: implementations
    //
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if GlobalConstants.updateLocationFlag == false {
            GlobalConstants.updateLocationFlag = true
            if let location = locations.last {
                stopMonitoring()
                currentLocation = location
                debugPrint(location.coordinate.latitude)
                self.delegate?.updateLocation()
            }
        }
    }
    
    
    //
    // MARK: operations
    //
    
    func startMonitoring() {
        locationManager.startUpdatingLocation()
    }
    
    func stopMonitoring() {
        locationManager.stopUpdatingLocation()
    }
}
