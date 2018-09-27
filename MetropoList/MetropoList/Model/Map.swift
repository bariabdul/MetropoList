//
//  Map.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation


//This struct will hold all the data that is related to the second view controller which is the map view. we will be needing the id to match and the name of the city to display at the top

struct Map {
    //these variables cannot be set by any other module
    private(set) public var cityId: Int
    private(set) public var cityName: String
    
    //an initializer for the struct mentioned above to create an instance of Map
    init(cityId: Int, cityName: String) {
        self.cityId = cityId
        self.cityName = cityName
    }
}
