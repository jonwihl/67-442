//
//  TenantRemindersDetailViewModelTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 12/8/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

import XCTest
@testable import rentBetter

class TenantRemindersDetailViewModelTests: XCTestCase {
	

	func test_id() {
		let prop = Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
		let viewModel = LandlordPropertiesDetailViewModel(property: prop)
		XCTAssertEqual("5445 Wilkins", viewModel.address())
	}
	
	//    func test_addrLine2() {
	//        XCTAssertEqual("N/A", viewModel.addr_line2)
	//    }
	
	func test_title(){
		let reminder1 = Reminder(id: 1, title: "Trash", description: "Take out the trash", created_on: "12/05/2018",removed_on: "12/07/2018", active: true, landlord_id: 1, property_id: 1)
		let viewModel = TenantReminderDetailViewModel(reminder: reminder1)
		XCTAssertEqual("Trash", viewModel.title())
	}
	
	func test_description(){
		let reminder1 = Reminder(id: 1, title: "Trash", description: "Take out the trash", created_on: "12/05/2018",removed_on: "12/07/2018", active: true, landlord_id: 1, property_id: 1)
		let viewModel = TenantReminderDetailViewModel(reminder: reminder1)
		XCTAssertEqual("Take out the trash", viewModel.description())
	}
	
	func test_createdOn(){
		let reminder1 = Reminder(id: 1, title: "Trash", description: "Take out the trash", created_on: "12/05/2018",removed_on: "12/07/2018", active: true, landlord_id: 1, property_id: 1)
		let viewModel = TenantReminderDetailViewModel(reminder: reminder1)
		XCTAssertEqual("12/05/2018", viewModel.created_on())
	}
	
	func test_removedOn(){
		let reminder1 = Reminder(id: 1, title: "Trash", description: "Take out the trash", created_on: "12/05/2018",removed_on: "12/07/2018", active: true, landlord_id: 1, property_id: 1)
		let viewModel = TenantReminderDetailViewModel(reminder: reminder1)
		XCTAssertEqual("12/07/2018", viewModel.removed_on())
	}
	
}
