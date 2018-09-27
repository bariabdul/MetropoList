//
//  MapViewController.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit
import MapKit

//this is the view controller file associated with the second screen which is the map view and in order to achieve that, we will have to conform to MKMapViewDelegate to place annotations and the city name to that annotation.
class MapViewController: UIViewController, MKMapViewDelegate {

    //an outlet to the map view that we have in storyboard
    @IBOutlet weak var mapView: MKMapView!
    
    //to have annotation access only from this file
    fileprivate var annotation: MKAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //first thing, get the name of the city that way you wont find yourself lost
        self.navigationItem.title = MapService.instance.getLocationData().cityName
        
        //set the delegate to self and map type to standard. you may prefer satellite too.. or maybe hybrid.. your call..
        mapView.delegate = self
        mapView.mapType = .standard
        // Do any additional setup after loading the view.
        
        
        //set the properties to annotation like the coordinates and a title associated with the annotation.
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.title = MapService.instance.getLocationData().cityName
        pointAnnotation.coordinate = CLLocationCoordinate2DMake(MapService.instance.getLocationData().cityLatitude, MapService.instance.getLocationData().cityLongitude)
        
        //set the annotation as per the coordinates and center them on the screen
        let pinAnnotationView = MKAnnotationView(annotation: pointAnnotation, reuseIdentifier: nil)
        self.mapView.centerCoordinate = pointAnnotation.coordinate
        self.mapView.addAnnotation(pinAnnotationView.annotation!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
