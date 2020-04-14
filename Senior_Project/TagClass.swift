//
//  TagClass.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class TagClass: NSObject {
    
    var tagName: String!
    var tagID: Int!

     init(inpTagName: String!, inpTagID: Int!){
        tagName = inpTagName
        tagID = inpTagID
    }
}
