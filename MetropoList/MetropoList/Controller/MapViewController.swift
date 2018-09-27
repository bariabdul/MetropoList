//
//  MapViewController.swift
//  MetropoList
//
//  Created by Bari Abdul on 9/26/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    fileprivate var annotation: MKAnnotation!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = MapService.instance.getLocationData().cityName
        
        mapView.delegate = self
        mapView.mapType = .standard
        // Do any additional setup after loading the view.
        
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.title = MapService.instance.getLocationData().cityName//item.1["name"].stringValue
        pointAnnotation.coordinate = CLLocationCoordinate2DMake(MapService.instance.getLocationData().cityLatitude, MapService.instance.getLocationData().cityLongitude)
        
        let pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: nil)
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
