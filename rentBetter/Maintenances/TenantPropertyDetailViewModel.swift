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
	
	
	func refresh() {
		print("hello")
		client.fetchProperties { [unowned self] data in
                if let props = self.parser.propertiesFromSearchResponse(data) {
                    self.properties = props
                }
                print(self.properties)
		}
	}
	
	
	init() {
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
