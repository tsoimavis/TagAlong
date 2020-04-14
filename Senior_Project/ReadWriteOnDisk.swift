//
//  ReadWriteOnDisk.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class ReadWriteOnDisk: NSObject {
    static let docsURL = try! FileManager.default.url(for: .documentDirectory,
                                                         in: .userDomainMask,
                                                         appropriateFor: nil,
                                                         create: true)
       
       static let tagPath = docsURL.appendingPathComponent("tag.plist").path
       static let userPath = docsURL.appendingPathComponent("user.plist").path
       static let locationPath = docsURL.appendingPathComponent("location.plist").path

       
       class func writeTag ()   {
           
           AppData.sharedInstance.offlineTag = Array<TagClass> ()
           for anyList in AppData.sharedInstance.currentTag  {
            
                   AppData.sharedInstance.offlineTag.append(anyList)
               
           }
           NSKeyedArchiver.archiveRootObject(AppData.sharedInstance.offlineTag,
                                             toFile: tagPath)
       }
       
       class func readTag ()  {
           if let readTag = NSKeyedUnarchiver.unarchiveObject(withFile: tagPath) as? Array <TagClass> {
               AppData.sharedInstance.offlineTag = readTag
           }
       }
       
    
         class func writeLocation ()   {
          
          AppData.sharedInstance.offlineLocation = Array<LocationClass> ()
          for anyList in AppData.sharedInstance.currentLocation  {
           
                  AppData.sharedInstance.offlineLocation.append(anyList)
              
          }
          NSKeyedArchiver.archiveRootObject(AppData.sharedInstance.offlineLocation,
                                            toFile: locationPath)
    }
    
      
      class func readLocation ()  {
          if let readLocation = NSKeyedUnarchiver.unarchiveObject(withFile: locationPath) as? Array <LocationClass> {
              AppData.sharedInstance.offlineLocation = readLocation
          }
      }
         
         class func writeUser ()   {
             NSKeyedArchiver.archiveRootObject(AppData.sharedInstance.curUser!,
                                               toFile: userPath)
         }
         
         class func readUser ()   {
             if let readUser = NSKeyedUnarchiver.unarchiveObject(withFile: userPath) as? UserClass {
                 AppData.sharedInstance.curUser = readUser
             }
         }



}
