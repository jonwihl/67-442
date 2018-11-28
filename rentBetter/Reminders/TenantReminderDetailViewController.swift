//
//  TenantReminderDetailViewController.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class TenantReminderDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var viewModel: TenantReminderDetailViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let viewModel = viewModel{
            let title = viewModel.title()
            let description = viewModel.description()
            titleLabel.text = title
            descriptionLabel.text = description
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

