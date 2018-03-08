//
//  LocationManager.swift
//  CoreLocationDelegateExample
//
//  Created by Pasan Premaratne on 1/19/17.
//  Copyright © 2017 Treehouse Island, Inc. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    //NSObject:make this class an objective C class.
    //CLL...:conformance to this protocol(func in the protocol on objC can be optional, no need to conform all)
    let manager = CLLocationManager()
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        //asynchronous(異步的) method: the code that runs when we call this method isn't executed immediately.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first!)
    }
}
















