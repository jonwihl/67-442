//
//  InfoViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 10/30/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class TenantPropertyDetailViewController: UIViewController {
	
    @IBOutlet weak var rent_Label: UILabel!
    @IBOutlet weak var addr_1_Label: UILabel!
    @IBOutlet weak var city_Label: UILabel!
    @IBOutlet weak var zipcode_Label: UILabel!
    @IBOutlet weak var state_Label: UILabel!
    @IBOutlet weak var startDate_Label: UILabel!
    @IBOutlet weak var endDate_Label: UILabel!
	
    var viewModel = TenantPropertyDetailViewModel()
    
    override func viewDidLoad() {
			super.viewDidLoad()
			navigationController?.navigationBar.barTintColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
			
			tabBarController?.tabBar.barTintColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewModel.refresh()
//		viewModel!.refresh(_, completion: () -> Void)
//
//		for property in viewModel!.properties {
//			if (property.id == 1){
//				viewModel!.property = property
//			}
//		}
		
		
		//		self.title = viewModel?.title()
		

//            let addr_line1 = viewModel.address()
//            let city = viewModel.city()
//            let state = viewModel.state()
//            let zip = viewModel.zipcode()
//            let start_date = viewModel.start()
//            let end_date = viewModel.end()
//            let rent = viewModel.rent()
			
			addr_1_Label.text = "5445 Wilkins Ave"
			city_Label.text = "Pittsburgh"
			state_Label.text = "PA"
			zipcode_Label.text = "15289"
			startDate_Label.text = "2018-12-06"
			endDate_Label.text = "2018-12-06"
			rent_Label.text = String(3500)
	}

	
	
}
