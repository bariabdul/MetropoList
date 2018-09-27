//
//  MapService.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation

class MapService {
    static let instance = MapService()
    
    var id: String!
    var city: Cities!
    
    var cityDetails = [
        Map(cityId: 0, cityName: "")
    ]
    
    func getMapDetails() -> [Map] {
        return cityDetails
    }
    
    func setID(id: String) {
        self.id = id
    }
    
    func getID() -> String {
        return self.id
    }
    
    func setLocationData(city: Cities) {
        self.city = city
    }
    
    func getLocationData() -> Cities {
        return self.city
    }
}
