//
//  TenantMaintenancesViewModel.swift
//  rentBetter
//
//  Created by Arnav Jain on 12/1/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class TenantMaintenancesViewModel {
	var maintenances = [Maintenance]()
	var filteredMaintenances = [Maintenance]()
	
	let client = SearchMaintenancesClient()
	let parser = MaintenancesParser()
	
	func refresh(_ completion: @escaping () -> Void) {
		client.fetchMaintenances{ [unowned self] data in
			if let maintenance = self.parser.tenantMaintenancesFromSearchResponse(data) {
				self.maintenances = maintenance
			}
			completion()
		}
	}
	
	func numberOfRows() -> Int {
		if filteredMaintenances.isEmpty {
			return maintenances.count
		} else {
			return filteredMaintenances.count
		}
	}
	
	func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
		guard indexPath.row >= 0 && indexPath.row < maintenances.count else {
			return ""
		}
		if filteredMaintenances.isEmpty {
			return maintenances[indexPath.row].title
		} else {
			return filteredMaintenances[indexPath.row].title
		}
	}
	
	func summaryForRowAtIndexPath(_ indexPath: IndexPath) -> String {
		guard indexPath.row >= 0 && indexPath.row < maintenances.count else {
			return ""
		}
		if filteredMaintenances.isEmpty {
			return maintenances[indexPath.row].description
		} else {
			return filteredMaintenances[indexPath.row].description
		}
	}
	
	func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> TenantMaintenancesDetailViewModel {
		let fix = (filteredMaintenances.isEmpty ? maintenances[indexPath.row] : filteredMaintenances[indexPath.row])
		return TenantMaintenancesDetailViewModel(maintenance: fix)
	}
	
	func updateFiltering(_ searchText: String) -> Void {
		filteredMaintenances = self.maintenances.filter { maintenance in
			return maintenance.title.lowercased().contains(searchText.lowercased())
		}
	}
	
}
