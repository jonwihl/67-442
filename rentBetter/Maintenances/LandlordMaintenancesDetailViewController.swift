//
//  LandlordMaintenancesDetailViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Alamofire
import UIKit

class LandlordMaintenancesDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var photo: UILabel!
		@IBOutlet	weak var createdLabel: UILabel!
	
	
		var viewModel: LandlordMaintenancesDetailViewModel?
	
		@IBAction func markComplete(_ sender: Any) {
			viewModel?.deactivate()
			
		}

	
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let viewModel = viewModel{
                let title = viewModel.title()
                let description = viewModel.description()
                let photo = viewModel.photo()
								let created = viewModel.created_on()
                titleLabel.text = title
                descriptionLabel.text = description
								createdLabel.text = created
        }
    }
    
    @IBAction func updateMaintenance(_ sender: Any) {
        print("posting params")
        let id = viewModel!.id()
        let  parameters = [
            "active":false] as [String : Any]
        
        Alamofire.request("https://protected-gorge-28359.herokuapp.com/maintenances/\(id)", method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseString { (response:DataResponse<String>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print(response.result.value)
									let alert = UIAlertController(title: "Complete!", message: "Marked as Completed.", preferredStyle: UIAlertController.Style.alert)
									alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
									self.present(alert, animated: true, completion: nil)
                }
                
                
                
                break
                
            case .failure(_):
                print(response.result.error)
                break
                
            }
            
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
