//
//  YouBike.swift
//  ASiC_YouBike
//
//  Created by WU CHIH WEI on 2018/2/23.
//  Copyright © 2018年 WU CHIH WEI. All rights reserved.
//

import Foundation

struct YouBikeStation: Codable, StationInfo {
    
    let name: String
    
    let position: String
    
    let totalBikes: String
    
    let remainBikes: String
    
    let longitude: String
    
    let latitude: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "sna"
        
        case position = "ar"
        
        case totalBikes = "tot"
        
        case remainBikes = "sbi"
        
        case longitude = "lng"
        
        case latitude = "lat"
    }
}

struct YouBikeManager: Codable {
    
    var stations: [YouBikeStation]
    
    enum CodingKeys: String, CodingKey {
        
        case stations = "datas"
        
    }
    
    static func createManagerFromFile() -> YouBikeManager {
        
        let filePath = Bundle.main.path(
            
            forResource: YouBikeConstant.fileName.rawValue,
            
            ofType: YouBikeConstant.fileType.rawValue
            
        )
        
        let filePathURL = URL(fileURLWithPath: filePath!)
        
        do {
            
            let data = try Data(contentsOf: filePathURL, options: .mappedIfSafe)
            
            let jsonDecoder = JSONDecoder()
            
            let youbikeManager = try jsonDecoder.decode(YouBikeManager.self, from: data)
            
            return youbikeManager
            
        } catch {
            
            fatalError()
        }
    }
}

enum YouBikeConstant: String {
    
    case fileName = "YouBikeStations"
    
    case fileType = "json"
}
