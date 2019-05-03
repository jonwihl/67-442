//
//  TenantRemindersViewModelTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 12/8/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

import XCTest
@testable import rentBetter

class TenantRemindersViewModelTests: XCTestCase {
	
	func test_numberOfRows() {
		let reminders = [createReminder()]
		let viewModel = TenantRemindersViewModel()
		viewModel.reminders = reminders
		
		XCTAssertEqual(viewModel.numberOfRows(), 1)
	}
	
	func test_titleForRowAtIndexPath() {
		let reminder = createReminder()
		let viewModel = TenantRemindersViewModel()
		viewModel.reminders = [reminder]
		
		let indexPath1 = IndexPath(row: 0, section: 0)
		XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath1), "Trash")
	}
	
	func test_summaryForRowAtIndexPath() {
		let reminder = createReminder()
		let viewModel = TenantRemindersViewModel()
		viewModel.reminders = [reminder]
		
		let indexPath1 = IndexPath(row: 0, section: 0)
		XCTAssertEqual(viewModel.summaryForRowAtIndexPath(indexPath1), "Take out the trash")
	}
	
	
	func createReminder() -> Reminder {
		return Reminder(id: 1, title: "Trash", description: "Take out the trash", created_on: "12/05/2018",
										removed_on: "12/07/2018", active: true, landlord_id: 1, property_id: 1)
	}
	
}
