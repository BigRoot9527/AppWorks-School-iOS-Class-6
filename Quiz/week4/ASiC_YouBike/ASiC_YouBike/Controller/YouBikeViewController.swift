//
//  YouBikeViewController.swift
//  ASiC_YouBike
//
//  Created by WU CHIH WEI on 2018/2/25.
//  Copyright © 2018年 WU CHIH WEI. All rights reserved.
//

import UIKit
import MapKit

protocol StationInfo {
    
    var name: String { get }
    
    var position: String { get }
    
    var remainBikes: String { get }
}

class YouBikeViewController: UIViewController, DelegateClientProtocol /* DelegateClientProtocol is conformed protocol, swift only can inherit from One class (UIViewController) */{

    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var stationAdress: UILabel!
    @IBOutlet weak var bikeRemain: UILabel!

    @IBOutlet weak var mapView: MKMapView!
    
    let closureClient = ClosureClient()
    
    var delegateClient = DelegateClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateClient.delegate = self //self = instance of class
        delegateClient.loadData()
        
        closureClient.getDataFromFile { (annotation) in
            mapView.addAnnotation(annotation)
            let center = CLLocationCoordinate2D(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
            let viewRegion = MKCoordinateRegionMakeWithDistance(center, 500, 500)
            let adjustedRegion = mapView.regionThatFits(viewRegion)
            mapView.setRegion(adjustedRegion, animated: true)
            mapView.showsUserLocation = true
        }
        
        
    }
    
    func didGetDataFromFile(stationInfo: StationInfo) {
        stationName.text = stationInfo.name
        stationAdress.text = stationInfo.position
        bikeRemain.text = "剩 \(stationInfo.remainBikes) 台"
    }
}
