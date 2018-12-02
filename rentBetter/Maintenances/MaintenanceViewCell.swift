//
//  MaintenanceViewCell.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/1/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class MaintenanceViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
			
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
				self.titleLabel.textColor = UIColor(red: 41/100, green: 41/100, blue: 41/100, alpha: 1)

        // Configure the view for the selected state
    }
    
    
}
