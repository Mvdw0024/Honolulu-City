//
//  ViewController.swift
//  Honolulu City
//
//  Created by mobapp08 on 29/01/2020.
//  Copyright © 2020 mobapp08. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager.init()
    var artworks = [POI]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        artworks = DAO.sharedInstance.getAllArtWorks()
        locationManager.requestWhenInUseAuthorization()
        
        let visRegion = MKCoordinateRegion.init(center: CLLocationCoordinate2D(latitude: 21.3972222, longitude: -157.97333333), latitudinalMeters: 60000, longitudinalMeters: 60000)
        mapView.region = visRegion
        mapView.addAnnotations(artworks)
    }
}

