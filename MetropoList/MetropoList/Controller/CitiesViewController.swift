//
//  ViewController.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var lati = 0.0, long = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return CityListCell()
    }
    
    func getData() {
//        let urlStr: String = "https://s3-eu-west-1.amazonaws.com/uploads-eu.hipchat.com/128845/1765144/LqgK6ORrJR4VZ1G/cities.json.zip"
//        let url = URL(string: urlStr)
//        //let urlRequest = URLRequest(url: url!)
//        //let session = URLSession.shared
//        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            guard error == nil else {
//                print(error)
//                return
//            }
//
//            guard let responseData = data else {
//                print("Error")
//                return
//            }
//
//            do {
//                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
//                    print("Error converting")
//                    return
//                }
//            }
//        }
        
        if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                guard let jsonArray = jsonResult as? [[String: Any]] else {
                    return//, let city = jsonResult["country"] as? [Any] {
                    //print(city)
                }
                //print(jsonArray)
                for dic in jsonArray {
                    guard let country = dic["country"] as? String else { return }
                    guard let city = dic["name"] as? String else { return }
                    //guard let coord = dic["coord"]
                    if let coord = dic["coord"] as? [String: Any] {
                        let lat = coord["lat"] as? Double
                        let lon = coord["lon"] as? Double
                        lati = lat ?? 0.0
                        long = lon ?? 0.0
                        
                    }
                    print("\(city), \(country), coordinates are \(lati) and \(long)")
                }
                
                //for coord in
            } catch {
                
            }
    }
}
}

