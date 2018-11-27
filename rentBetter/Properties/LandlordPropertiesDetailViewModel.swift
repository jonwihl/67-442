//
//  LandlordPropertiesDetailViewModel.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation


class LandlordPropertiesDetailViewModel {
	var property: Property
	var tenant: Tenant
	
	init(property: Property, tenant: Tenant) {
		self.property = property
		self.tenant = tenant
	}
	
	func address() -> String {
		return property.addr_line1
	}
	
	func city() -> String? {
		return property.city
	}
	
	func state() -> String? {
		return property.state
	}
	
	func zipcode() -> String? {
		return property.zipcode
	}
	
	func rent() -> Int? {
		return property.rent
	}
	
	func start() -> String? {
		return property.start_date
	}
	
	func end() -> String? {
		return property.end_date
	}
	
	func name() -> String? {
		if property.id == tenant.property_id{
				return tenant.name
		}
		else{
			return "x"
		}
	}
	
	func phone() -> String? {
		if property.id == tenant.property_id{
			return tenant.phone
		}
		else{
			return "x"
		}
	}
	
}
