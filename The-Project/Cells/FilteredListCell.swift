//
//  FilteredListCell.swift
//  The-Project
//
//  Created by user171840 on 7/14/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class FilteredListCell: UITableViewCell {
    static let id = "FilteredListCell"
    @IBOutlet weak var tourImage: UIImageView!
    
    @IBOutlet weak var tourLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        tourLabel.text = "abcda"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
