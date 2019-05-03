//
//  TenantMaintenancesViewModelTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 12/8/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

import XCTest
@testable import rentBetter

class TenantMaintenancesViewModelTests: XCTestCase {
	
	func test_numberOfRows() {
		let maintenances = [createMaintenance()]
		let viewModel = TenantMaintenancesViewModel()
		viewModel.maintenances = maintenances
		
		XCTAssertEqual(viewModel.numberOfRows(), 1)
	}
	
	func test_titleForRowAtIndexPath() {
		let maintenance1 = createMaintenance()
		let viewModel = TenantMaintenancesViewModel()
		viewModel.maintenances = [maintenance1]
		
		let indexPath1 = IndexPath(row: 0, section: 0)
		XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath1), "Sink not running")
	}
	
	func test_summaryForRowAtIndexPath() {
		let maintenance1 = createMaintenance()
		let viewModel = TenantMaintenancesViewModel()
		viewModel.maintenances = [maintenance1]
		
		let indexPath1 = IndexPath(row: 0, section: 0)
		XCTAssertEqual(viewModel.summaryForRowAtIndexPath(indexPath1), "10/15/2018")
	}
	
	
	
	func createMaintenance() -> Maintenance {
		return Maintenance(id: 1, title: "Sink not running", description: "No water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", photo: "xyz", active: true, property_id: 1, tenant_id: 1)
	}
	
}
