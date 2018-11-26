//
//  LandlordPropertiesDetailViewModelTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import XCTest
@testable import rentBetter

class LandlordPropertiesDetailViewModelTests: XCTestCase {
    
	
	
    
    func test_addrLine1() {
        let prop = Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
			let viewModel = LandlordPropertiesDetailViewModel(property: prop)
        XCTAssertEqual("5445 Wilkins", viewModel.address())
    }
    
//    func test_addrLine2() {
//        XCTAssertEqual("N/A", viewModel.addr_line2)
//    }
	
    func test_city(){
			let prop = Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
			let viewModel = LandlordPropertiesDetailViewModel(property: prop)
        XCTAssertEqual("Pittsburgh", viewModel.city())
    }
    
    func test_state(){
			let prop = Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
			let viewModel = LandlordPropertiesDetailViewModel(property: prop)
        XCTAssertEqual("PA", viewModel.state())
    }
    
    func test_zipcode(){
			let prop = Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
			let viewModel = LandlordPropertiesDetailViewModel(property: prop)
        XCTAssertEqual("15217", viewModel.zipcode())
    }
    
    func test_rent(){
			let prop = Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
			let viewModel = LandlordPropertiesDetailViewModel(property: prop)
        XCTAssertEqual(3900, viewModel.rent())
    }
    
    func test_startDate(){
			let prop = Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
			let viewModel = LandlordPropertiesDetailViewModel(property: prop)
        XCTAssertEqual("6/1/2018", viewModel.start())
    }
    
    func test_endDate(){
			let prop = Property(id: 1, addr_line1: "5445 Wilkins", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true, landlord_id: 1)
			let viewModel = LandlordPropertiesDetailViewModel(property: prop)
        XCTAssertEqual("6/2/2019", viewModel.end())
    }

    
    
}


