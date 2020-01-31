//
//  DAO.swift
//  Honolulu City
//
//  Created by mobapp08 on 29/01/2020.
//  Copyright © 2020 mobapp08. All rights reserved.
//

import Foundation
import MapKit

class DAO{
    static var sharedInstance:DAO = DAO.init()
    private init(){}
    
    func getAllArtWorks() -> [POI] {
        var artworks = [POI]()
        let url = URL.init(string:"https://data.honolulu.gov/resource/yef5-h88r.json")
        
        do{
            let data = try Data.init(contentsOf: url!)
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject]
            
            for item in jsonArray{
                var creator:String
                
                if let toCheck = item.value(forKey:"creator") {
                    creator = toCheck as! String
                }else{
                    
                    creator = "Unknown"
                }
                var credit:String
                if let toCheck = item.value(forKey: "credit"){
                    credit = toCheck as! String
                }else{
                    credit = "Unknown"
                }
                var date:String
                if let toCheck = item.value(forKey: "date"){
                    date = toCheck as! String
                }else{
                    date = "Unknown"
                }
                var description:String
                if let toCheck = item.value(forKey: "description"){
                    description = toCheck as! String
                }else{
                    description = "Unknown"
                }
                var locationname:String
                
                if let toCheck = item.value(forKey:"locationname") {
                    locationname = toCheck as! String
                }else{
                    
                    locationname = "Unknown"
                }
                var discipline:String
                
                if let toCheck = item.value(forKey:"discipline") {
                    discipline = toCheck as! String
                }else{
                    
                    discipline = "Unknown"
                }
                var title:String
                
                if let toCheck = item.value(forKey:"title") {
                    title = toCheck as! String
                }else{
                    
                    title = "Unknown"
                }
                var latitude:Double
                
                if let toCheck = item.value(forKey:"latitude") {
                    let latTxt = toCheck as! String
                    latitude = Double.init(latTxt)!
                }else{
                    
                    latitude = 1
                }
                var longitude:Double
                
                if let toCheck = item.value(forKey:"longitude") {
                    let longTxt = toCheck as! String
                    longitude = Double.init(longTxt)!
                }else{
                    
                    longitude = 1
                }
                
                let poi = POI.init(creator: creator, credit: credit, date: date, description: description, coordinate: CLLocationCoordinate2DMake(latitude,longitude), locationname: locationname, title: title, discipline: discipline)
                
                artworks.append(poi)
            }
        }catch{
            print("failed")
        }
        return artworks
        
    }
    
    
}



