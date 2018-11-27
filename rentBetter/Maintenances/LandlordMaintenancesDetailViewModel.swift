//
//  LandlordMaintenancesDetailViewModel.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation
import Alamofire

class LandlordMaintenancesDetailViewModel {
	var maintenance: Maintenance
	
	init(maintenance: Maintenance) {
		self.maintenance = maintenance
	}
	
	func title() -> String {
		return maintenance.title
	}
	
	func description() -> String? {
		return maintenance.description
	}
	
	func created_on() -> String? {
		return maintenance.created_on
	}
	
	func closed_on() -> String? {
		return maintenance.closed_on
	}
	
	func photo() -> String? {
		return maintenance.photo
	}
	
	func active() -> Bool?{
		return maintenance.active
	}
	
	func deactivate() {
		maintenance.active = false
		
		let  parameters = [
			"id":6,
			"title": "Mold",
			"description": "Mold in Basement",
			"photo": "",
			"created_on": "2018-01-11",
			"closed_on": "",
			"active":false,
			"property_id":5,
			"tenant_id":10
			] as [String : Any]
		
		Alamofire.request("https://protected-gorge-28359.herokuapp.com/maintenances", method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseString { (response:DataResponse<String>) in
			
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
}
