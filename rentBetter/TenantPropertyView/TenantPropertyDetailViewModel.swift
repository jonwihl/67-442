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
	
	func refresh() {
		print("hello")
		client.fetchProperties { [unowned self] data in
			if let props = self.parser.tenantPropertiesFromSearchResponse(data) {
				self.properties = props
			}
			print(self.properties)
		}
	}
	
	
	init(property: Property) {
		self.property = property
	}
	
	func address() -> String {
		return properties[1].addr_line1
	}
	
	func city() -> String? {
		return properties[1].city
	}
	
	func state() -> String? {
		return properties[1].state
	}
	
	func zipcode() -> String? {
		return properties[1].zipcode
	}
	
	func rent() -> Int? {
		return properties[1].rent
	}
	
	func start() -> String? {
		return properties[1].start_date
	}
	
	func end() -> String? {
		return properties[1].end_date
}

}
