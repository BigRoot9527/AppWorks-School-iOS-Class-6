//
//  ClosureClient.swift
//  ASiC_YouBike
//
//  Created by WU CHIH WEI on 2018/2/24.
//  Copyright © 2018年 WU CHIH WEI. All rights reserved.
//
import MapKit

class YouBikeAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    
    var subtitle: String?
    
    var coordinate: CLLocationCoordinate2D
    
    init(station: YouBikeStation) {
        
        self.title = station.name
        
        self.subtitle = station.position
        
        self.coordinate = CLLocationCoordinate2D(
            
            latitude: Double(station.latitude)!,
            longitude: Double(station.longitude)!
        
        )
    }
}

/*
    Call the getDataFromFile(:) method, ClosureClient will generate a MKAnnotation instance.
 
    You can get the instance through the closure which is the parameter of the getDataFromFile(:) method.
*/

struct ClosureClient {
    
    func getDataFromFile(completion: (MKAnnotation) -> Void) -> Void {
        
        let manager = YouBikeManager.createManagerFromFile()
        
        guard manager.stations.count > 0 else { return }
        
        let annotation = YouBikeAnnotation(station: manager.stations[0])
        
        completion(annotation)
    }
}
