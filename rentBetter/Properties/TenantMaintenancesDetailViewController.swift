//
//  TenantMaintenanceDetailViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 12/1/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation
import UIKit

class TenantMaintenancesDetailViewController: UIViewController {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UITextView!
	@IBOutlet weak var submitted: UILabel!
	@IBOutlet weak var status: UILabel!
	//	@IBOutlet weak var photo: UILabel!
	
	
	var viewModel: TenantMaintenancesDetailViewModel?
	
	//	@IBAction func markComplete(_ sender: Any) {
	//		viewModel?.deactivate()
	//
	//	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if let viewModel = viewModel{
			let title = viewModel.title()
			let description = viewModel.description()
			let submit = viewModel.created_on()
			let completed = viewModel.status()
			//			let photo = viewModel.photo()
			titleLabel.text = title
			descriptionLabel.text = description
			submitted.text = submit
			status.text = completed
		}
	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	
	
}
