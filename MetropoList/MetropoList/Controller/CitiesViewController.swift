//
//  ViewController.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit


/*
 
 This View Controller file is responsible to hold delegates for the search bar, table view. it helps in displaying the labels in the table view by calling the table view cells sublass method update views and reusing the identifier to make it efficient. I prefer using arrays in this case throughout the application since I find it easier to perform operations based on needs, for example filtering or sorting.
 
 I made sure that I follow MVC design pattern to separate out the logic from the UI that way code is much cleaner and much more understandable.
 
 */

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlet for the table view
    @IBOutlet weak var tableView: UITableView!

    //maintain an array other than the cities array in order to have filtered results as per user search
    var filteredCities = [Cities]()
    //initializing the search controller within the same view
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set up a few parameters here for the search controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search cities"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
        definesPresentationContext = true
        
        //set the table views delegate and data source to this view controller
        tableView.delegate = self
        tableView.dataSource = self

        self.tableView.rowHeight = 75
        
        
        //After fetching the cities, as per the requirement I have sorted the array based on the name of the city and then reloaded the table view
        CityService.instance.fetchCities()
        CityService.instance.cities.sort(by: { $0.cityName < $1.cityName })
            self.tableView.reloadData()
    }
    
    //this table view data source method will tell the table view to have a certain number of rows according to the original list or the filtered list while performing the search
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCities.count
        }
        return CityService.instance.getCities().count
    }
    
    //this method will ask the data source which is this view controller for a cell to insert in a particular location
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as? CityListCell {
            let city: Cities
            if isFiltering() {
                city = filteredCities[indexPath.row]
            } else {
                city = CityService.instance.getCities()[indexPath.row]
            }
            //after sorting out if its the filtered list or the original list to be dislpayed, call the updateViews function to render the cells.
            cell.updateViews(city: city)
            return cell
        } else {
            return CityListCell()
        }
    }
    
    //it will tell the delegate which row has been selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //based on the results displayed on the screen, pass the right indexPath.row to see the correct output in the next screen
        if !isFiltering() {
            MapService.instance.setLocationData(city: CityService.instance.getCities()[indexPath.row])
        } else {
            MapService.instance.setLocationData(city: filteredCities[indexPath.row])
        }
        
        //after the index is selected, perform the segue
        performSegue(withIdentifier: "toMapView", sender: indexPath)
    }
    
    //this function will return true if the search bar is empty or nil
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    //this function will filter the cities based on the search text and will put the results in filtered cities array
    func filterContentsForSearchText(_ searchText: String, scope: String = "All") {
        filteredCities = CityService.instance.getCities().filter({( city: Cities) -> Bool in
            return city.cityName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    //with this function, the table view will be able to determine when to use filtered results. it will simply check whether the user is searching 
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension CitiesViewController: UISearchResultsUpdating {
    //this method will help the view controller to respond to search bar, which will help in updating the results based on the information the user enters into the search bar
    func updateSearchResults(for searchController: UISearchController) {
        filterContentsForSearchText(searchController.searchBar.text!)
    }
}

