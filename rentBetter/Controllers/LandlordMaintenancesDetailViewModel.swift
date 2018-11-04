//
//  LandlordMaintenancesDetailViewModel.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class LandlordMaintenancesDetailViewModel {
	let maintenance: Maintenance
	
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
}
