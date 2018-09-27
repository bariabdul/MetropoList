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
        Cities(cityId: "", cityName: "", countryName: "", cityLatitude: 0, cityLongitude: 0)
    ]
    
    func getCities() -> [Cities] {
        return cities
    }
    
    func fetchCities(/*completion: @escaping CompletionHandler*/) {
        self.cities.removeAll()
        if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                guard let jsonArray = jsonResult as? [[String: Any]] else {
                    return
                }
                
                for listOfCities in jsonArray {
                    //print(listOfCities["_id"] as? String)
                    //guard let id = listOfCities["_id"] as? String else { return }
                    let id: String = "\(listOfCities["_id"] ?? 0)"
                    //let id = String(id1)
                    guard let country = listOfCities["country"] as? String else { return }
                    guard let city = listOfCities["name"] as? String else { return }
                    
                    if let coordinates = listOfCities["coord"] as? [String: Any] {
                        let latitude = coordinates["lat"] as? Double
                        let longitude = coordinates["lon"] as? Double
                        
                        self.cities.append(Cities(cityId: id, cityName: city, countryName: country, cityLatitude: latitude ?? 0.0, cityLongitude: longitude ?? 0.0))
                        //UserDetailService.instance.userDetails.sort(by: { $0.userTitle > $1.userTitle })
                        //print("Before Sort")
                        //self.cities.sort(by: { $0.cityName > $1.cityName })
                        //print("After sort")
                    }
                }
                //completion(true)
            }
            catch {
                print("Error appending the array of cities.")
            }
            //completion(true)
        }
        //completion(true)
    }
}
