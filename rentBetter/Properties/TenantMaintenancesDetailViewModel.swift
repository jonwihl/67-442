//
//  TenantMaintenanceDetailViewModel.swift
//  rentBetter
//
//  Created by Arnav Jain on 12/1/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class TenantMaintenancesDetailViewModel {
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
	
	func status() -> String?{
		if maintenance.active{
			return "Incomplete"
		}
		else{
			return "Complete"
		}
}
}
