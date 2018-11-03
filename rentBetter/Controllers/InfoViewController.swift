//
//  InfoViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 10/30/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
//    var property = Property(addr_1: "5445", street: "Wilkins Ave", zipcode: "15217", city: "Pittsburgh", state: "PA", rent: "5000", start_date: "10/31/2018", end_date: "10/31/2019")
	
    @IBOutlet weak var rent_Label: UILabel!
    @IBOutlet weak var Addr_1_Label: UILabel!
    
    @IBOutlet weak var city_Label: UILabel!
    @IBOutlet weak var zipcode_Label: UILabel!
    
    @IBOutlet weak var state_Label: UILabel!
    
    @IBOutlet weak var startDate_Label: UILabel!
    @IBOutlet weak var endDate_Label: UILabel!
    
    override func viewDidLoad() {
		super.viewDidLoad()
        updateLabelAddr()
		// Do any additional setup after loading the view, typically from a nib.
	}
    
//    func updateLabelAddr() -> Void {
//        Addr_1_Label.text = property.addr_1 + property.street
//        zipcode_Label.text = property.zipcode
//        state_Label.text = property.state
//        startDate_Label.text = property.start_date
//        endDate_Label.text = property.end_date
//        rent_Label.text = property.rent
//        city_Label.text = property.city
//
//    }
//
	
	
	
}
