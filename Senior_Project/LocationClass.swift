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
    var tagItems: Array <TagClass>!
    
    init(inpLocationName: String, inpCoordinate: String!, inpTagItems: Array <TagClass>){
        locationName = inpLocationName
        coordinate = inpCoordinate
        tagItems = inpTagItems
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
           let thisLocationName = aDecoder.decodeObject(forKey: "locationName") as! String
           let thisCoordinate = aDecoder.decodeObject(forKey: "coordinate") as! String
           let thisTagItems = aDecoder.decodeObject(forKey: "tagItems") as! Array<TagClass>
           
           self.init(inpLocationName: thisLocationName,
                     inpCoordinate: thisCoordinate,
                     inpTagItems: thisTagItems)
       }
       
       func encode(with aCoder: NSCoder) {
           aCoder.encode(self.locationName, forKey: "locationName")
           aCoder.encode(self.coordinate, forKey: "coordinate")
           aCoder.encode(self.tagItems, forKey: "tagItems")
       }

}
