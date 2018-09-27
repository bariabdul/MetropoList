//
//  CityService.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import Foundation


/*
 
 
 This service file will help to set attributes like the city and country name in the title bar and cells 
 
 
 */

class CityService {
    //create a singleton instance to have an access point to this class members and functions from anywhere in the app
    static let instance = CityService()
    
    //Initialize an array with empty values as I thought best to use arrays throughout this application.
    var cities = [
        Cities(cityId: "", cityName: "", countryName: "", cityLatitude: 0, cityLongitude: 0)
    ]
    
    //write getters to have an array of cities info from anywhere in the app
    func getCities() -> [Cities] {
        return cities
    }
    
    //this function will read the data from json file and parse the json to get necessary information.
    func fetchCities() {
        //always start with clearing out the array in case of any duplicates
        self.cities.removeAll()
        
        //read the json filr and start parsing the json
        if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                guard let jsonArray = jsonResult as? [[String: Any]] else {
                    return
                }
                
                for listOfCities in jsonArray {
                    //get the id, city name and the remaining properties from the json file
                    let id: String = "\(listOfCities["_id"] ?? 0)"
                    guard let country = listOfCities["country"] as? String else { return }
                    guard let city = listOfCities["name"] as? String else { return }
                    
                    if let coordinates = listOfCities["coord"] as? [String: Any] {
                        let latitude = coordinates["lat"] as? Double
                        let longitude = coordinates["lon"] as? Double
                        
                        //after getting all that data, append the array so that we have an array of all the details needed
                        self.cities.append(Cities(cityId: id, cityName: city, countryName: country, cityLatitude: latitude ?? 0.0, cityLongitude: longitude ?? 0.0))
                    }
                }
            }
            catch {
                print("Error reading the json and parsing.")
            }
        }
    }
}
