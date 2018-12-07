//
//  TenantMaintenanceViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 12/1/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation
import UIKit

class TenantMaintenancesViewController: UITableViewController  {
	
	
	let viewModel = TenantMaintenancesViewModel()
	@IBOutlet var maintenancesTable: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.maintenancesTable.register(UINib(nibName: "MaintenanceViewCell", bundle: nil), forCellReuseIdentifier: "MaintenanceCell")
		viewModel.refresh { [unowned self] in
			DispatchQueue.main.async {
				self.maintenancesTable.reloadData()
			}
		}
		
		// Do any additional setup after loading the view.
		navigationController?.navigationBar.barTintColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
		
		tabBarController?.tabBar.barTintColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRows()
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "MaintenanceCell", for: indexPath) as! MaintenanceViewCell
		cell.titleLabel?.text = viewModel.titleForRowAtIndexPath(indexPath)
		cell.summaryLabel?.text = "Submitted: " + viewModel.summaryForRowAtIndexPath(indexPath)
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: "toTenantM", sender: indexPath)
	}
	
	// MARK: Segues
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let detailVC = segue.destination as? TenantMaintenancesDetailViewController,
			let indexPath = sender as? IndexPath {
			detailVC.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
		}
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

