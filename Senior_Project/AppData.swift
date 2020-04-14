//
//  AppData.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class AppData: NSObject {

    // singleton pattern
    static let sharedInstance = AppData()
    
    var curUser : UserClass?
    var currentTag: Array <TagClass>!
    var offlineTag: Array <TagClass>!
    var currentLocation: Array <LocationClass>!
    var offlineLocation: Array <LocationClass>!
    
    public override init ()
    {
        currentTag = Array<TagClass> ()
        currentLocation = Array<LocationClass> ()
    
        
    }
    
    
}
