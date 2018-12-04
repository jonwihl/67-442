//
//  TenantReminderDetailViewController.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit
import Alamofire
class TenantReminderDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var viewModel: TenantReminderDetailViewModel?
    
    @IBAction func markAsRead(_ sender: Any) {
        let id = viewModel!.id()
        let  parameters = [
            "active":false] as [String : Any]
        
        Alamofire.request("https://protected-gorge-28359.herokuapp.com/reminders/\(id)", method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseString { (response:DataResponse<String>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print(response.result.value)
                }
                
                
                
                break
                
            case .failure(_):
                print(response.result.error)
                break
                
            }
            
        }
    }
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

