//
//  POI.swift
//  Honolulu City
//
//  Created by mobapp08 on 29/01/2020.
//  Copyright © 2020 mobapp08. All rights reserved.
//

import Foundation
import MapKit

class POI: NSObject,MKAnnotation {
    
    var creator: String?
    var credit: String?
    var date: String?
    var artdescription: String?
    var coordinate: CLLocationCoordinate2D
    var locationname: String?
    var title: String?
    var discipline: String?
    
    internal init(creator: String?, credit: String?, date: String?, description: String?, coordinate: CLLocationCoordinate2D, locationname: String?, title: String?, discipline: String?) {
        self.creator = creator
        self.credit = credit
        self.date = date
        self.artdescription = description
        self.coordinate = coordinate
        self.locationname = locationname
        self.title = title
        self.discipline = discipline
    }
    
}


