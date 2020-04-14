//
//  TagsViewController.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {


    @IBOutlet weak var tagsTableView: UITableView!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        tagsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readTag()
        dump(AppData.sharedInstance.curUser)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)

        if #available(iOS 10.0, *) {
            tagsTableView.refreshControl = refreshControl
        } else {
            tagsTableView.backgroundView = refreshControl
        }
    }
    
   @objc func refresh(_ refreshControl: UIRefreshControl) {
    tagsTableView.reloadData()
        refreshControl.endRefreshing()
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
            
            ReadWriteOnDisk.writeLocation()
            ReadWriteOnDisk.writeTag()
            ReadWriteOnDisk.writeUser()
        }
        else
        {
            ReadWriteOnDisk.readTag()
            AppData.sharedInstance.currentTag = AppData.sharedInstance.offlineTag
        }
    }
    
    @IBAction func addTag(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return AppData.sharedInstance.currentTag.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagsCell", for: indexPath)
        
        let thisList = AppData.sharedInstance.currentTag[indexPath.row] as TagClass
        
        let id = String(thisList.tagID)
        cell.textLabel?.text = thisList.tagName + " " + id

        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        AppData.sharedInstance.currentTag.remove(at: indexPath.row)
        ReadWriteOnDisk.writeTag()
        
        
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete?"
    }
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toItemsSegue_id", sender: indexPath)
    }
    */
}
