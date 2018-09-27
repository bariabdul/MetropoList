//
//  MapService.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation

/*
 
 
This service file will help to set attributes like the city name in the title bar and the correct co-ordinates for that city into the map view.
 
 
 */

class MapService {
    //create a singleton instance to have an access point to this class members and functions from anywhere in the app
    static let instance = MapService()
    
    //Initialize an id to match with the city selected; To properly have setters and getters, initialize Cities object
    var id: String!
    var city: Cities!
    
    //Initialize an array with empty values as I thought best to use arrays throughout this application.
    var cityDetails = [
        Map(cityId: 0, cityName: "")
    ]
    
    func getMapDetails() -> [Map] {
        return cityDetails
    }
    
    //id setters and getter will help in performing segue and checking for correct id passed
    func setID(id: String) {
        self.id = id
    }
    
    func getID() -> String {
        return self.id
    }
    
    //before performing the segue, in order to get correct results, the setter for location is set before performing segue and then in Map view Controller call the getter to get the values
    func setLocationData(city: Cities) {
        self.city = city
    }
    
    func getLocationData() -> Cities {
        return self.city
    }
}
