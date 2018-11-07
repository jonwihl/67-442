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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return viewModel.numberOfRows()
		}
	
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
			cell.name?.text = viewModel.titleForRowAtIndexPath(indexPath)
			cell.summary?.text = viewModel.summaryForRowAtIndexPath(indexPath)
			return cell
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
