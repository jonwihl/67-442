//
//  TenantPropertyDetailViewModel.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class TenantPropertyDetailViewModel {
	var properties = [Property]()

	let client = SearchPropertiesClient()
	let parser = PropertiesParser()
	
	var property: Property
	
	func refresh(_ completion: @escaping () -> Void) {
		client.fetchProperties { [unowned self] data in
			if let props = self.parser.propertiesFromSearchResponse(data) {
				self.properties = props
			}
			completion()
		}
	}
	

	
	init(property: Property) {
		self.property = property
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

}
