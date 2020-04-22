//
//  IconCollectionViewCell.swift
//  Senior_Project
//
//  Created by Mavis Tsoi on 4/21/20.
//  Copyright © 2020 CMPE195B. All rights reserved.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        

        let blueView = UIView(frame: bounds)
        blueView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)
        self.selectedBackgroundView = blueView
    }
    
}
