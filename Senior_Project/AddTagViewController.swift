//
//  AddTagViewController.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class AddTagViewController: UIViewController {

    @IBOutlet weak var statusTextField: UILabel!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var savebutton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        readTag()
        savebutton.layer.cornerRadius = 4
        dump(AppData.sharedInstance.curUser)
        showStatus(s: "")
    }
    
    func showStatus(s: String){
        statusTextField.text = s
    }
    
    func readTag(){
           ReadWriteOnDisk.readUser()
           if ( AppData.sharedInstance.curUser == nil)
           {
               // the very first time anyone uses this app
               AppData.sharedInstance.curUser = UserClass (inpName: "Me",
                                                           inpEmail: "defEmail",
                                                           inpUid: "defUid")
               PrepareList.prepare()
               
               
               ReadWriteOnDisk.writeTag()
               ReadWriteOnDisk.writeUser()
           }
           else
           {
               ReadWriteOnDisk.readTag()
               AppData.sharedInstance.currentTag = AppData.sharedInstance.offlineTag
           }
       }
    
    func newTagSave(inpName: String){
        let newTag = TagClass(inpTagName: inpName, inpTagID: AppData.sharedInstance.offlineTag.count+1)
        AppData.sharedInstance.currentTag.append(newTag)
        
 
      
        
        ReadWriteOnDisk.writeTag()
    }
    
    @IBAction func goBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    @IBAction func saveTag(_ sender: Any) {
        newTagSave(inpName: inputName.text!)
        var name = String(inputName.text!)
        showStatus(s: "\(name) saved successfully! ")
 
        
    }
}
