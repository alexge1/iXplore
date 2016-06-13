//
//  PlaceTableViewCell.swift
//  iXplore
//
//  Created by Alexander Ge on 6/9/16.
//  Copyright © 2016 Alexander Ge. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
