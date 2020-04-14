//
//  PrepareList.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class PrepareList: NSObject {
    class func prepare(){
        let tag_1 = TagClass(inpTagName: "cellphone",
                    inpTagID: 1)
        
        let tag_2 = TagClass(inpTagName: "wallet",
        inpTagID: 2)
        
        let tag_3 = TagClass(inpTagName: "key",
        inpTagID: 3)
        
         
        AppData.sharedInstance.currentTag.append(tag_1)
        AppData.sharedInstance.currentTag.append(tag_2)
        AppData.sharedInstance.currentTag.append(tag_3)
    }
    
}
