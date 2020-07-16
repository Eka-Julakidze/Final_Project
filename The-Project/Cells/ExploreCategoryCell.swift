//
//  ExploreCategoryCell.swift
//  The-Project
//
//  Created by user171840 on 7/13/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ExploreCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    
   static public func configure(image: UIImage) {
        categoryImage.layer.borderWidth = 2
        categoryImage.layer.borderColor = UIColor.red
        
    }
}
