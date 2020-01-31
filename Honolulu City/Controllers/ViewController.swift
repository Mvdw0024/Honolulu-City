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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let poi = annotation as? POI{
            
            if let customView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin"){
                
                customView.annotation = poi
                return customView
                
            }else{
                
                let customView = MKPinAnnotationView.init(annotation: poi, reuseIdentifier: "pin")
                
                customView.canShowCallout = true
                customView.layer.shadowColor = nil
                let btn = UIButton(type: .detailDisclosure)
                customView.rightCalloutAccessoryView = btn
                
                return customView
            }
            
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "mapDetailsSegue", sender: view)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapDetailsSegue"{
            if let destination = segue.destination as? DetailsViewController {
                destination.artwork = ((sender as! MKAnnotationView).annotation as! POI)
            }
        }
        
    }
    
}
