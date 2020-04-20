//
//  LoactionClass.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/14/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit
import CoreLocation

class LocationClass: NSObject, NSCoding {
    
    var locationName: String!
    var coordinate: String!
    var zuoBiao: CLLocation?
    var tagItems: Array <TagClass>!
    
    init(inpLocationName: String, inpCoordinate: String!,inpZuoBiao: CLLocation!,  inpTagItems: Array <TagClass>){
        locationName = inpLocationName
        zuoBiao = inpZuoBiao
        coordinate = inpCoordinate
        tagItems = inpTagItems
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
           let thisLocationName = aDecoder.decodeObject(forKey: "locationName") as! String
           let thisCoordinate = aDecoder.decodeObject(forKey: "coordinate") as! String
           let thisZuoBiao = aDecoder.decodeObject(forKey: "zuoBiao") as? CLLocation
           let thisTagItems = aDecoder.decodeObject(forKey: "tagItems") as! Array<TagClass>
           
           self.init(inpLocationName: thisLocationName,
                     inpCoordinate: thisCoordinate,
                     inpZuoBiao: thisZuoBiao,
                     inpTagItems: thisTagItems)
       }
       
       func encode(with aCoder: NSCoder) {
           aCoder.encode(self.locationName, forKey: "locationName")
           aCoder.encode(self.coordinate, forKey: "coordinate")
            aCoder.encode(self.zuoBiao, forKey: "zuoBiao")
           aCoder.encode(self.tagItems, forKey: "tagItems")
       }

}
