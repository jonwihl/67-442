//
//  LandlordPropertiesViewModelTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import XCTest
@testable import rentBetter

class LandlordMaintenancesViewModelTests: XCTestCase {
    
    func test_numberOfRows() {
        let maintenances = [createMaintenance()]
        let viewModel = LandlordMaintenancesViewModel()
        viewModel.maintenances = maintenances
        
        XCTAssertEqual(viewModel.numberOfRows(), 1)
    }
    
    func test_titleForRowAtIndexPath() {
        let maintenance1 = createMaintenance()
        let viewModel = LandlordMaintenancesViewModel()
        viewModel.maintenances = [maintenance1]
        
        let indexPath1 = IndexPath(row: 0, section: 0)
        XCTAssertEqual(viewModel.titleForRowAtIndexPath(indexPath1), "Sink not running")
    }
    
    
    func createMaintenance() -> Maintenance {
        return Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", photo: "xyz", active: true)
    }
    
}

