//
//  launchViewController.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/22/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class launchViewController: UIViewController {

    @IBOutlet weak var gifImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImg.loadGif(name: "ani")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
