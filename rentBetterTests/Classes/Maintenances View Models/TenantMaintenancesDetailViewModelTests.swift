//
//  TenantMaintenancesDetailViewModelTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 12/8/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

import XCTest
@testable import rentBetter

class TenantMaintenancesDetailViewModelTests: XCTestCase {
	
	func test_title() {
		let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", photo: "xyz", active: true, property_id: 1, tenant_id: 1)
		let viewModel = TenantMaintenancesDetailViewModel(maintenance: main)
		XCTAssertEqual("Sink not running", viewModel.title())
	}
	
	func test_description(){
		let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", photo: "xyz", active: true, property_id: 1, tenant_id: 1)
		let viewModel = TenantMaintenancesDetailViewModel(maintenance: main)
		XCTAssertEqual("no water is coming out of the kitchen sink", viewModel.description())
	}
	
	func test_createdOn(){
		let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", photo: "xyz", active: true, property_id: 1, tenant_id: 1)
		let viewModel = TenantMaintenancesDetailViewModel(maintenance: main)
		XCTAssertEqual("10/15/2018", viewModel.created_on())
	}
	
	func test_closedOn(){
		let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", photo: "xyz", active: true, property_id: 1, tenant_id: 1)
		let viewModel = TenantMaintenancesDetailViewModel(maintenance: main)
		XCTAssertEqual("10/20/2018", viewModel.closed_on())
	}
	
	func test_photo(){
		let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", photo: "xyz", active: true, property_id: 1, tenant_id: 1)
		let viewModel = TenantMaintenancesDetailViewModel(maintenance: main)
		XCTAssertEqual("xyz", viewModel.photo())
	}
	
	func test_active(){
		let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", photo: "xyz", active: true, property_id: 1, tenant_id: 1)
		let viewModel = TenantMaintenancesDetailViewModel(maintenance: main)
		XCTAssertEqual("Complete", viewModel.status())
	}
	
}



