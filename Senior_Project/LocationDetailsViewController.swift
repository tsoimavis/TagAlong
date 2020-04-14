//
//  LocationDetailsViewController.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/14/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class LocationDetailsViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var locaddress: UILabel!
    @IBOutlet weak var locNameLabel: UILabel!
    @IBOutlet weak var coordinateTextField: UITextField!
    @IBOutlet weak var locTagTableView: UITableView!
    
    public var curLocInt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.readData()
        locNameLabel.text = AppData.sharedInstance.currentLocation[curLocInt].locationName
        showaddress()
        
               
               coordinateTextField.returnKeyType = UIReturnKeyType.done
               coordinateTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func showaddress(){
        locaddress.text = AppData.sharedInstance.currentLocation[curLocInt].coordinate
    }
    
    func readData ()
     {
         ReadWriteOnDisk.readUser()
         if ( AppData.sharedInstance.curUser == nil)
         {
             // the very first time anyone uses this app
             AppData.sharedInstance.curUser = UserClass (inpName: "Me",
                                                         inpEmail: "defEmail",
                                                         inpUid: "defUid")
             PrepareList.prepare()
             
             ReadWriteOnDisk.writeLocation()
             ReadWriteOnDisk.writeTag()
             ReadWriteOnDisk.writeUser()
         }
         else
         {
             ReadWriteOnDisk.readLocation()
             ReadWriteOnDisk.readTag()
             ReadWriteOnDisk.readUser()
             AppData.sharedInstance.currentLocation = AppData.sharedInstance.offlineLocation
         }
     }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
      
   
        
        AppData.sharedInstance.currentLocation[curLocInt].coordinate = textField.text
       // itemsTableView.reloadData()
        dump(AppData.sharedInstance.currentLocation)
        ReadWriteOnDisk.writeLocation()
        showaddress()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return AppData.sharedInstance.currentTag.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "locTagCells", for: indexPath)
        
        let thisList = AppData.sharedInstance.currentTag[indexPath.row] as TagClass
        
    
        cell.textLabel?.text = thisList.tagName

               // programatically switch make to the table view
        let switchView = UISwitch(frame: .zero)
        if(AppData.sharedInstance.currentLocation[curLocInt].tagItems.contains{ $0.tagName == thisList.tagName }){
                  switchView.setOn(true, animated: true)
              }
        else{
            switchView.setOn(false, animated: true)
        }
                
                switchView.backgroundColor = .clear;
                switchView.tag = indexPath.row // for detect which row switch Changed
                switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
                cell.accessoryView = switchView



        return cell
    }

    @objc func switchChanged(_ sender : UISwitch!){
        let addTag = AppData.sharedInstance.currentTag[sender.tag]
        
        if(sender.isOn){
        AppData.sharedInstance.currentLocation[curLocInt].tagItems.append(addTag)
         dump(AppData.sharedInstance.currentLocation)
         ReadWriteOnDisk.writeLocation()
        }
        
        if(!sender.isOn){
            let index = AppData.sharedInstance.currentLocation[curLocInt].tagItems.firstIndex(of: addTag) ?? 0
            AppData.sharedInstance.currentLocation[curLocInt].tagItems.remove(at: index)
            
            dump(AppData.sharedInstance.currentLocation)
            ReadWriteOnDisk.writeLocation()
        }
        locTagTableView.reloadData()
    }

    
    

}
