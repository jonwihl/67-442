//
//  LandlordPropertiesViewController.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/3/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class LandlordPropertiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	let viewModel = LandlordPropertiesViewModel()
	
	@IBOutlet var propertiesTable: UITableView!
	

    override func viewDidLoad() {
        super.viewDidLoad()
				viewModel.refresh { [unowned self] in
					DispatchQueue.main.async {
						self.propertiesTable.reloadData()
					}

        // Do any additional setup after loading the view.
    }
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return viewModel.numberOfRows()
		}
	
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PropertiesTableViewCell
			cell.address?.text = viewModel.addrForRowAtIndexPath(indexPath)
			return cell
		}
	
	
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			performSegue(withIdentifier: "toDetailVC", sender: indexPath)
		}
	
		// MARK: Segues
		override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			if let detailVC = segue.destination as? LandlordPropertiesDetailViewController,
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