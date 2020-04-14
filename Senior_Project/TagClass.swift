//
//  TagClass.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class TagClass: NSObject,NSCoding {
 
    var tagName: String!
    var tagID: Int!

     init(inpTagName: String!, inpTagID: Int!){
        tagName = inpTagName
        tagID = inpTagID
    }
    
    func encode(with acoder: NSCoder) {
        acoder.encode(self.tagName, forKey: "tagName")
        acoder.encode(self.tagID, forKey: "tagID")

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let tagName = aDecoder.decodeObject(forKey: "tagName") as! String
        let tagID = aDecoder.decodeObject(forKey: "tagID") as! Int
      
        
        self.init(inpTagName: tagName, inpTagID: tagID)
    }
}
