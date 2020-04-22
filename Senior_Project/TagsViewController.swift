//
//  TagsViewController.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/13/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate   {
   
    

   // @IBOutlet weak var tagsTableView: UITableView!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        readTag()
        dump(AppData.sharedInstance.tagIconList)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)

        if #available(iOS 10.0, *) {
            tagsCollectionView.refreshControl = refreshControl
        } else {

            tagsCollectionView.backgroundView = refreshControl
        }
        
               let lpgr = UILongPressGestureRecognizer(target: self,
                             action:#selector(self.handleLongPress))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.tagsCollectionView.addGestureRecognizer(lpgr)
    }
    
   @objc func refresh(_ refreshControl: UIRefreshControl) {
//    tagsTableView.reloadData()
    tagsCollectionView.reloadData()
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
  /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return AppData.sharedInstance.currentTag.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagsCell", for: indexPath)
        
        let thisList = AppData.sharedInstance.currentTag[indexPath.row] as TagClass
        
        let id = String(thisList.tagID)
        cell.textLabel?.text = thisList.tagName + " " + id
        
        cell.imageView?.image = thisList.tagIcon
        
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toItemsSegue_id", sender: indexPath)
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {         return AppData.sharedInstance.currentTag.count;
        
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagViewCell", for: indexPath) as! TagViewCollectionViewCell

        cell.tagImg.image = AppData.sharedInstance.currentTag[indexPath.row].tagIcon
        cell.tagNmlabel.text = AppData.sharedInstance.currentTag[indexPath.row].tagName


                  return cell
       }
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
    //    if gestureRecognizer.state != UIGestureRecognizer.State.ended {
      //     return
       //}

        let p = gestureRecognizer.location(in: self.tagsCollectionView)
        let indexPath = self.tagsCollectionView.indexPathForItem(at: p)
        if gestureRecognizer.state != UIGestureRecognizer.State.began {
       if let index = indexPath {
        var cell = self.tagsCollectionView.cellForItem(at: index)
           // do stuff with your cell, for example print the indexPath
            print(index.row)
     
        let alertActionCell = UIAlertController(title: "Delete Tag", message: "Are you sure to delete \(String(AppData.sharedInstance.currentTag[index.row].tagName)) ?", preferredStyle: .actionSheet)

                // Configure Remove Item Action
                let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                    AppData.sharedInstance.currentTag.remove(at: indexPath!.row)
                    ReadWriteOnDisk.writeTag()
                     dump(AppData.sharedInstance.currentTag)
                    print("Cell Removed")
                    self.tagsCollectionView!.reloadData()
                })

                // Configure Cancel Action Sheet
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { acion in
                    print("Cancel actionsheet")
                })

                alertActionCell.addAction(deleteAction)
                alertActionCell.addAction(cancelAction)
                self.present(alertActionCell, animated: true, completion: nil)
       

            }
        }
    
    else {
           print("Could not find index path")
       }

    }
    
    @IBAction func delMsg(_ sender: Any) {

     let alertController = UIAlertController(title: "Delete a tag", message:"Please long press the tag and confirm", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }

    
    
}
