//
//  ViewController.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource /*UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate*/ {
    
    @IBOutlet weak var tableView: UITableView!

    var filteredCities = [Cities]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search cities"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 75
        
        CityService.instance.fetchCities()//{ (success) in
        //UserDetailService.instance.userDetails.sort(by: { $0.userTitle > $1.userTitle })
        CityService.instance.cities.sort(by: { $0.cityName < $1.cityName })
            self.tableView.reloadData()
        //}
//        if text.contains("T") {
//            print("true")
//        } else {
//            print("false")
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCities.count
        }
        return CityService.instance.getCities().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as? CityListCell {
            let city: Cities
            if isFiltering() {
                city = filteredCities[indexPath.row]
            } else {
                city = CityService.instance.getCities()[indexPath.row]
            }
            //let city = CityService.instance.getCities()[indexPath.row]
            cell.updateViews(city: city)
            return cell
        } else {
            return CityListCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MapService.instance.setID(id: CityService.instance.getCities()[indexPath.row].cityId)
//        if searchController.searchBar.text == "" {
//            MapService.instance.setLocationData(city: CityService.instance.getCities()[indexPath.row])
//        } else {
//            MapService.instance.setLocationData(city: filteredCities[indexPath.row])
//        }
        
        if !isFiltering() {
                        MapService.instance.setLocationData(city: CityService.instance.getCities()[indexPath.row])
                    } else {
                        MapService.instance.setLocationData(city: filteredCities[indexPath.row])
                    }
        performSegue(withIdentifier: "toMapView", sender: indexPath)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentsForSearchText(_ searchText: String, scope: String = "All") {
        filteredCities = CityService.instance.getCities().filter({( city: Cities) -> Bool in
            return city.cityName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension CitiesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentsForSearchText(searchController.searchBar.text!)
    }
}

