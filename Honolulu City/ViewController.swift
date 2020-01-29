//
//  ViewController.swift
//  Honolulu City
//
//  Created by mobapp08 on 29/01/2020.
//  Copyright © 2020 mobapp08. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController{
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager.init()
    var data = DAO.sharedInstance.getAllArtWorks()
    var items:[POI]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        mapView.addAnnotations(data)
        
    }
    
    
}

