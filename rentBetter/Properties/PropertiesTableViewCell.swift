//
//  PropertiesTableViewCell.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/6/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation
import UIKit

class PropertiesTableViewCell: UITableViewCell {
	@IBOutlet weak var address: UILabel!
	@IBOutlet weak var start: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
		self.address.textColor = UIColor(red:0.04, green:0.19, blue:0.26, alpha:1.0)
	}
	
	
	
	
}
