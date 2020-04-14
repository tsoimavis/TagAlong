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
    override func viewDidLoad() {
        super.viewDidLoad()
        PrepareList.prepare()
        dump(AppData.sharedInstance.currentTag)
    }
    @IBAction func addTag(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return AppData.sharedInstance.currentTag.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagsCell", for: indexPath)
        
        let thisList = AppData.sharedInstance.currentTag[indexPath.row] as TagClass
        
        cell.textLabel?.text = thisList.tagName

        
        return cell
    }
    
}
