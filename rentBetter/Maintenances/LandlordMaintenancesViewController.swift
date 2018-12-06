//
//  LandlordMaintenanceViewController.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/3/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class LandlordMaintenancesViewController: UITableViewController  {
	
	
	let viewModel = LandlordMaintenancesViewModel()
	@IBOutlet var maintenancesTable: UITableView!
	
    @IBAction func refresh(_ sender: Any) {
        viewModel.refresh {
            [unowned self] in
            DispatchQueue.main.async {
                self.maintenancesTable.reloadData()
            }
        }
    }
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
		cell.summaryLabel?.text = viewModel.summaryForRowAtIndexPath(indexPath)
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: "toLandlordMVC", sender: indexPath)
	}
	
	// MARK: Segues
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let detailVC = segue.destination as? LandlordMaintenancesDetailViewController,
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
