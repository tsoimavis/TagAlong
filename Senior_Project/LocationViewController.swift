//
//  LocationViewController.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/14/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var locationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readData()
    }
   
    
    @IBAction func addLocation(_ sender: Any) {
        let alert = UIAlertController (title: "New Locaiton",
                                        message: "Please enter the Title of your new location",
                                        preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "new location"
            textField.font = UIFont.systemFont(ofSize: 22)
            textField.textAlignment = NSTextAlignment.center
        }
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: UIAlertAction.Style.default,
                                      handler:
            { (myAlert) in
                self.newListSave(inpName: alert.textFields![0].text!)
            }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertAction.Style.cancel,
                                      handler:nil ))
        
        self.present(alert, animated: true, completion: nil)
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AppData.sharedInstance.currentLocation.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCells", for: indexPath)
        
        let thisList = AppData.sharedInstance.currentLocation[indexPath.row] as LocationClass
        
        
        cell.textLabel?.text = thisList.locationName
       
        
        return cell
    }

    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        AppData.sharedInstance.currentLocation.remove(at: indexPath.row)
        ReadWriteOnDisk.writeLocation()
        
        
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete?"
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toLocationDetails_ID", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let locationCtrl : LocationDetailsViewController = segue.destination as! LocationDetailsViewController
        locationCtrl.curLocInt = (sender as! IndexPath).row
    }
    
    
    
    
    

    func newListSave (inpName: String)
    {
        let newLocation = LocationClass(inpLocationName: inpName,
                                       inpCoordinate: "",
                                       inpTagItems: [])
        
        AppData.sharedInstance.currentLocation.append(newLocation)
        
        locationTableView.reloadData()
        
        ReadWriteOnDisk.writeLocation()
    }
    
    
    
    
    
    
    
    


}
