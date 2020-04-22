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
    var tagIconList: Array <UIImage>!
    var ctagIconList: Array <UIImage>!
    
    public override init ()
    {
        currentTag = Array<TagClass> ()
        currentLocation = Array<LocationClass> ()
        
        tagIconList = Array<UIImage> ()
        tagIconList.append(UIImage(named: "i1")! )
        tagIconList.append(UIImage(named: "i2")! )
        tagIconList.append(UIImage(named: "i3")! )
        tagIconList.append(UIImage(named: "i4")! )
        tagIconList.append(UIImage(named: "i5")! )
        tagIconList.append(UIImage(named: "i6")! )
        tagIconList.append(UIImage(named: "i7")! )
        tagIconList.append(UIImage(named: "i8")! )
        tagIconList.append(UIImage(named: "i9")! )
        tagIconList.append(UIImage(named: "i10")! )
        tagIconList.append(UIImage(named: "i11")! )
        tagIconList.append(UIImage(named: "i12")! )
        tagIconList.append(UIImage(named: "i13")! )
        tagIconList.append(UIImage(named: "i14")! )
        tagIconList.append(UIImage(named: "i15")! )
        tagIconList.append(UIImage(named: "i16")! )
        tagIconList.append(UIImage(named: "i17")! )
        tagIconList.append(UIImage(named: "i18")! )
        tagIconList.append(UIImage(named: "i19")! )
        tagIconList.append(UIImage(named: "i20")! )
        
        ctagIconList = Array<UIImage> ()
        ctagIconList.append(UIImage(named: "i1L")! )
        ctagIconList.append(UIImage(named: "i2L")! )
        ctagIconList.append(UIImage(named: "i3L")! )
        ctagIconList.append(UIImage(named: "i4L")! )
        ctagIconList.append(UIImage(named: "i5L")! )
        ctagIconList.append(UIImage(named: "i6L")! )
        ctagIconList.append(UIImage(named: "i7L")! )
        ctagIconList.append(UIImage(named: "i8L")! )
        ctagIconList.append(UIImage(named: "i9L")! )
        ctagIconList.append(UIImage(named: "i10L")! )
        ctagIconList.append(UIImage(named: "i11L")! )
        ctagIconList.append(UIImage(named: "i12L")! )
        ctagIconList.append(UIImage(named: "i13L")! )
        ctagIconList.append(UIImage(named: "i14L")! )
        ctagIconList.append(UIImage(named: "i15L")! )
        ctagIconList.append(UIImage(named: "i16L")! )
        ctagIconList.append(UIImage(named: "i17L")! )
        ctagIconList.append(UIImage(named: "i18L")! )
        ctagIconList.append(UIImage(named: "i19L")! )
        ctagIconList.append(UIImage(named: "i20L")! )
        
        
        
    }
    
    
}
