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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let searchController = UISearchController(searchResultsController: nil)
        search
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
        return CityService.instance.getCities().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as? CityListCell {
         let city = CityService.instance.getCities()[indexPath.row]
            cell.updateViews(city: city)
            return cell
        } else {
            return CityListCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MapService.instance.setID(id: CityService.instance.getCities()[indexPath.row].cityId)
        MapService.instance.setLocationData(city: CityService.instance.getCities()[indexPath.row])
        performSegue(withIdentifier: "toMapView", sender: indexPath)
    }
    
//    func updateSearchResults(for searchController: UISearchController) {
//        <#code#>
//    }
}

extension CitiesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        <#code#>
    }
}

