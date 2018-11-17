//
//  TenantNewMaintenanceViewController.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/15/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit
import Alamofire

class TenantNewMaintenanceViewController: UIViewController {

    @IBAction func addJson(_ sender: Any) {
        print("posting params")
//        let parameters = [
//            "id":1,
//            "name":"Jonathan",
//            "phone":"6176105413",
//            "username":"jonwihl1",
//            "password" : "12345",
//            "password_confirmation": "12345",
//            "created_at":"2018-11-11T23:44:51.483Z",
//            "updated_at":"2018-11-11T23:44:51.483Z"
//            ] as [String : Any]
        
        let  parameters = [
            "id":4,
            "title":"Mold",
            "description":"Mold in Basement.",
            "photo": "",
            "created_on":"2018-01-11",
            "closed_on": "",
            "active":true,
            "property_id":5,"tenant_id":10,
            "created_at":"2018-11-15T23:35:51.547Z",
            "updated_at":"2018-11-15T23:35:51.547Z"
        ] as [String : Any]
        
        Alamofire.request("https://protected-gorge-28359.herokuapp.com/maintenances", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseString { (response:DataResponse<String>) in
            
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
