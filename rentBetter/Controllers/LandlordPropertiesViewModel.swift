//
//  LandlordPropertiesViewModel.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class LandlordPropertiesViewModel {
	var properties = [Property]()
	var filteredProperties = [Property]()
	
	let client = SearchPropertiesClient()
	let parser = PropertiesParser()
	
	func refresh(_ completion: @escaping () -> Void) {
		client.fetchProperties { [unowned self] data in
			if let props = self.parser.propertiesFromSearchResponse(data) {
				self.properties = props
			}
			completion()
		}
	}
	
	func numberOfRows() -> Int {
		if filteredProperties.isEmpty {
			return properties.count
		} else {
			return filteredProperties.count
		}
	}
	
	func addrForRowAtIndexPath(_ indexPath: IndexPath) -> String {
		guard indexPath.row >= 0 && indexPath.row < properties.count else {
			return ""
		}
		if filteredProperties.isEmpty {
			return properties[indexPath.row].addr_line1
		} else {
			return filteredProperties[indexPath.row].addr_line1
		}
	}
	
	func summaryForRowAtIndexPath(_ indexPath: IndexPath) -> String {
		guard indexPath.row >= 0 && indexPath.row < properties.count else {
			return ""
		}
		if filteredProperties.isEmpty {
			return properties[indexPath.row].state
		} else {
			return filteredProperties[indexPath.row].state
		}
	}
	
	func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> LandlordPropertiesDetailViewModel {
		let prop = (filteredProperties.isEmpty ? properties[indexPath.row] : filteredProperties[indexPath.row])
		return LandlordPropertiesDetailViewModel(property: prop)
	}
	
	func updateFiltering(_ searchText: String) -> Void {
		filteredProperties = self.properties.filter { property in
			return property.addr_line1.lowercased().contains(searchText.lowercased())
		}
	}
	
}
