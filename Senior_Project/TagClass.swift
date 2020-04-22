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
    var tagIcon: UIImage!
    var ctagIcon: UIImage!

     init(inpTagName: String!, inpTagID: Int!, inpTagIcon: UIImage!,inpCtagIcon: UIImage!){
        tagName = inpTagName
        tagID = inpTagID
        tagIcon = inpTagIcon
        ctagIcon = inpCtagIcon
    }
    
    func encode(with acoder: NSCoder) {
        acoder.encode(self.tagName, forKey: "tagName")
        acoder.encode(self.tagID, forKey: "tagID")
        acoder.encode(self.tagIcon, forKey: "tagIcon")
        acoder.encode(self.ctagIcon, forKey: "ctagIcon")

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let tagName = aDecoder.decodeObject(forKey: "tagName") as! String
        let tagID = aDecoder.decodeObject(forKey: "tagID") as! Int
        let tagIcon = aDecoder.decodeObject(forKey: "tagIcon") as! UIImage
        let ctagIcon = aDecoder.decodeObject(forKey: "ctagIcon") as! UIImage
      
        
        self.init(inpTagName: tagName, inpTagID: tagID, inpTagIcon: tagIcon,inpCtagIcon: ctagIcon )
    }
}
