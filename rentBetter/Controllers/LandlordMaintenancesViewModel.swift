//
//  LandlordMaintenancesViewModel.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class LandlordMaintenancesViewModel {
	var maintenanaces = [Maintenance]()
	var filteredMaintenances = [Maintenance]()
	
	let client = SearchMaintenancesClient()
	let parser = MaintenancesParser()
	
	func refresh(_ completion: @escaping () -> Void) {
		client.fetchMaintenances{ [unowned self] data in
			if let maintenance = self.parser.maintenancesFromSearchResponse(data) {
				self.maintenanaces = maintenance
			}
			completion()
		}
	}
	
	func numberOfRows() -> Int {
		if filteredMaintenances.isEmpty {
			return maintenanaces.count
		} else {
			return filteredMaintenances.count
		}
	}
	
	func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
		guard indexPath.row >= 0 && indexPath.row < maintenanaces.count else {
			return ""
		}
		if filteredMaintenances.isEmpty {
			return maintenanaces[indexPath.row].title
		} else {
			return filteredMaintenances[indexPath.row].title
		}
	}
	
	func summaryForRowAtIndexPath(_ indexPath: IndexPath) -> String {
		guard indexPath.row >= 0 && indexPath.row < maintenanaces.count else {
			return ""
		}
		if filteredMaintenances.isEmpty {
			return maintenanaces[indexPath.row].description
		} else {
			return filteredMaintenances[indexPath.row].description
		}
	}
	
	func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> LandlordMaintenancesDetailViewModel {
		let fix = (filteredMaintenances.isEmpty ? maintenanaces[indexPath.row] : filteredMaintenances[indexPath.row])
		return LandlordMaintenancesDetailViewModel(maintenance: fix)
	}
	
	func updateFiltering(_ searchText: String) -> Void {
		filteredMaintenances = self.maintenanaces.filter { maintenance in
			return maintenance.title.lowercased().contains(searchText.lowercased())
		}
	}
	
}
