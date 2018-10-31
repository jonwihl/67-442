//
//  InfoViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 10/30/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var property = Property(addr_1: "Wilkins Ave", rent: "5000")
	
    @IBOutlet weak var rent_Label: UILabel!
    @IBOutlet weak var Addr_1_Label: UILabel!
    
    
    override func viewDidLoad() {
		super.viewDidLoad()
        updateLabelAddr()
		// Do any additional setup after loading the view, typically from a nib.
	}
    
    func updateLabelAddr() -> Void {
        Addr_1_Label.text = property.rent
    }
    
    
	
	
}
