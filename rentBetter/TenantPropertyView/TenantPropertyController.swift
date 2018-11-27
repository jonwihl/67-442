//
//  InfoViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 10/30/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class TenantPropertyViewController: UIViewController {
	
    @IBOutlet weak var rent_Label: UILabel!
    @IBOutlet weak var addr_1_Label: UILabel!
    @IBOutlet weak var city_Label: UILabel!
    @IBOutlet weak var zipcode_Label: UILabel!
    @IBOutlet weak var state_Label: UILabel!
    @IBOutlet weak var startDate_Label: UILabel!
    @IBOutlet weak var endDate_Label: UILabel!
    
    override func viewDidLoad() {
			super.viewDidLoad()
			
			navigationController?.navigationBar.barTintColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
			
			tabBarController?.tabBar.barTintColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
//			self.view.backgroundColor = UIColor(red: 65/100, green: 85/100, blue: 97/100, alpha: 1)

//        updateLabelAddr()
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
