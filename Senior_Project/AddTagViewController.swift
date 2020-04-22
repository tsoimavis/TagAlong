//
//  AddTagViewController.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class AddTagViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var IconCollectionView: UICollectionView!
    @IBOutlet weak var statusTextField: UILabel!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var savebutton: UIButton!
    var inpIcon: UIImage! = UIImage(named: "i1")
    var inpCIcon: UIImage! = UIImage(named: "i1L")
    var index: Int = 18

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
    
    func newTagSave(inpName: String,inpIcon: UIImage,inpCIcon: UIImage){
        let newTag = TagClass(inpTagName: inpName, inpTagID: AppData.sharedInstance.offlineTag.count+1, inpTagIcon:inpIcon,inpCtagIcon:inpCIcon  )
        AppData.sharedInstance.currentTag.append(newTag)
        
 
      
        
        ReadWriteOnDisk.writeTag()
    }
    
    @IBAction func goBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    @IBAction func saveTag(_ sender: Any) {
        if(inputName.text! != ""){
            
            newTagSave(inpName: inputName.text!, inpIcon: inpIcon! ,inpCIcon:inpCIcon!)
        
        var name = String(inputName.text!)
        showStatus(s: "\(name) saved successfully! ")
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   //     print(AppData.sharedInstance.tagIconList.count)
        return AppData.sharedInstance.tagIconList.count
        
       
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       inpIcon = AppData.sharedInstance.tagIconList[indexPath.row]
        inpCIcon = AppData.sharedInstance.ctagIconList[indexPath.row]
        index = indexPath.row
        IconCollectionView.reloadData();
        
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as! IconCollectionViewCell
        if(index == indexPath.row){
            cell.iconImg.image = AppData.sharedInstance.ctagIconList[indexPath.row]
        }
        else{
            cell.iconImg.image = AppData.sharedInstance.tagIconList[indexPath.row]
        }


        return cell
    }
}
