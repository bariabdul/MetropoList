//
//  Cities.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation


//This struct will hold all the data that is related to the first view controller which is the table view. Here we will be needing the id to make matches for segues and the name of the city, country, latitude and longitude

struct Cities {
    //These properties cannot be set by any other module and can be accessible by an other module
    private(set) public var cityId: String
    private(set) public var cityName: String
    private(set) public var countryName: String
    private(set) public var cityLatitude: Double
    private(set) public var cityLongitude: Double
    
    //an initializer for the struct mentioned above to create an instance of Cities
    init(cityId: String, cityName: String, countryName: String, cityLatitude: Double, cityLongitude: Double) {
        self.cityId = cityId
        self.cityName = cityName
        self.countryName = countryName
        self.cityLatitude = cityLatitude
        self.cityLongitude = cityLongitude
    }
}
