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
    
    
    var currentTag: Array <TagClass>!
    
    
    public override init ()
    {
        currentTag = Array<TagClass> ()

        
    }
    
    
}
