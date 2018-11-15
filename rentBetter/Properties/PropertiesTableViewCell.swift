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
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
		self.address.textColor = UIColor(red: 41/100, green: 41/100, blue: 41/100, alpha: 1)
	}
	
	
	
	
}
