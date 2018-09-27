//
//  Map.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation

struct Map {
    private(set) public var cityId: Int
    private(set) public var cityName: String
    
    init(cityId: Int, cityName: String) {
        self.cityId = cityId
        self.cityName = cityName
    }
}
