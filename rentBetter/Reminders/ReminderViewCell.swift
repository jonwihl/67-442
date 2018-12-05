//
//  ReminderViewCell.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//


import UIKit

class ReminderViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.titleLabel.textColor = UIColor(red:0.04, green:0.19, blue:0.26, alpha:1.0)
        
        // Configure the view for the selected state
    }
}


