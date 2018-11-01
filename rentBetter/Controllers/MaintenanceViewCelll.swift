//
//  MaintenanceViewCell.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/1/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class MaintenanceViewCelll: UITableViewCell {
    
    let maintenance = Maintenance(title: "Broken Sink", created_on: "11/1/2018")

    @IBOutlet weak var createdOnLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        updateCellLabel()

        // Configure the view for the selected state
    }
    
    func updateCellLabel() -> Void {
        createdOnLabel.text = maintenance.created_on
        titleLabel.text = maintenance.title
    }

}
