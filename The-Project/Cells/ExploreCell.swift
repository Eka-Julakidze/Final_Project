//
//  ExploreCell.swift
//  The-Project
//
//  Created by user171840 on 7/13/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ExploreCell: UITableViewCell {
    public static let id = "ExploreCell"
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var categoryImage: UIImageView!
    var tours = [Response]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}


