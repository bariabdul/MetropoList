//
//  Cities.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation

struct Cities {
    private(set) public var cityId: String
    private(set) public var cityName: String
    private(set) public var countryName: String
    private(set) public var cityLatitude: Double
    private(set) public var cityLongitude: Double
    
    init(cityId: String, cityName: String, countryName: String, cityLatitude: Double, cityLongitude: Double) {
        self.cityId = cityId
        self.cityName = cityName
        self.countryName = countryName
        self.cityLatitude = cityLatitude
        self.cityLongitude = cityLongitude
    }
}
