//
//  LandlordPropertiesDetailViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//


import UIKit

class LandlordPropertiesDetailViewController: UIViewController {
	
	@IBOutlet weak var addr_line1: UILabel!
	@IBOutlet weak var city: UILabel!
	@IBOutlet weak var state: UILabel!
	@IBOutlet weak var zip: UILabel!
	@IBOutlet weak var start_date: UILabel!
	@IBOutlet weak var end_date: UILabel!
	@IBOutlet weak var rent: UILabel!
	
	var viewModel: LandlordPropertiesDetailViewModel?
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
//		self.title = viewModel?.title()
		
		if let viewModel = viewModel{
			let addr_line1 = viewModel.address()
			let city = viewModel.city()
			let state = viewModel.state()
			let zip = viewModel.zipcode()
			let start_date = viewModel.start()
			let end_date = viewModel.end()
			let rent = viewModel.rent()
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
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
