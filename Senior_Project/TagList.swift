
//
//  TagList.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class TagList: NSObject {
    var tagListItems : Array <TagClass>!
    
    init(inpTagListItems: Array <TagClass> ){
        tagListItems = inpTagListItems
    }

}
