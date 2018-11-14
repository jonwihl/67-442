//
//  LandlordMaintenancesDetailViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//


import UIKit

class LandlordMaintenancesDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photo: UILabel!
    
    var viewModel: LandlordMaintenancesDetailViewModel?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        self.title = viewModel?.title()
        
        if let viewModel = viewModel{
                let title = viewModel.title()
                let description = viewModel.description()
                let photo = viewModel.photo()
                titleLabel.text = title
                descriptionLabel.text = description
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
