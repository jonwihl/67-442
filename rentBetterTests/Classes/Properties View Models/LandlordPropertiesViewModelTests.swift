//
//  LandlordPropertiesViewModelTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import XCTest
@testable import rentBetter

class LandlordPropertiesViewModelTests: XCTestCase {
    
    func test_numberOfRows() {
        let properties = [createProperty()]
				let viewModel = LandlordPropertiesViewModel()
        viewModel.properties = properties
        
        XCTAssertEqual(viewModel.numberOfRows(), 1)
    }
    
    func test_titleForRowAtIndexPath() {
        let property1 = createProperty()
        let viewModel = LandlordPropertiesViewModel()
        viewModel.properties = [property1]
        
        let indexPath1 = IndexPath(row: 0, section: 0)
        XCTAssertEqual(viewModel.addrForRowAtIndexPath(indexPath1), "5445 Wilkins")
    }
	
		func test_summaryForRowAtIndexPath(){
			let property1 = createProperty()
			let viewModel = LandlordPropertiesViewModel()
			viewModel.properties = [property1]
			
			let indexPath1 = IndexPath(row: 0, section: 0)
			XCTAssertEqual(viewModel.summaryForRowAtIndexPath(indexPath1), "6/1/2018")
			
		}
    
    
    func createProperty() -> Property {
			return Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
    }
    
}


