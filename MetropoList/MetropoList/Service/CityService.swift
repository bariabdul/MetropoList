//
//  CityService.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation

class CityService {
    static let instance = CityService()
    
    var cities = [
        Cities(cityName: "", countryName: "", cityLatitude: 0, cityLongitude: 0)
    ]
    
    func getCities() -> [Cities] {
        return cities
    }
    
    func fetchCities() {
        if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                guard let jsonArray = jsonResult as? [[String: Any]] else {
                    return
                }
                
                for listOfCities in jsonArray {
                    guard let country = listOfCities["country"] as? String else { return }
                    guard let city = listOfCities["name"] as? String else { return }
                    
                    if let coordinates = listOfCities["coord"] as? [String: Any] {
                        let latitude = coordinates["lat"] as? Double
                        let longitude = coordinates["lon"] as? Double
                        
                        self.cities.append(Cities(cityName: city, countryName: country, cityLatitude: latitude ?? 0.0, cityLongitude: longitude ?? 0.0))
                    }
                }
            } catch {
                print("Error appending the array of cities.")
            }
        }
    }
}
