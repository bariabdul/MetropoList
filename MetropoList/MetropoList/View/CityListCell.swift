//
//  CityListCell.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit

//This sublass of TableViewCell will have an outlet for the label and also a function to reflect the name of the city and country in the label in each cell


class CityListCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //function to set the text to the label in our cell
    func updateViews(city: Cities) {
        cityLabel.text = "\(city.cityName), \(city.countryName)"
    }

}
