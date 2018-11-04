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
    
    let property = createProperty()
    let viewModel = RepositoryDetailViewModel([property])
    
    
    func createProperty() -> Property {
        return Property(id: 1, addr_line1: "5445 Wilkins", addr_line2: "N/A", city: "Pittsburgh", state: "PA", zipcode: "15217", rent: 3900, start_date: "6/1/2018", end_date: "6/2/2019", active: true)
    }
    
    func test_addrLine1() {
        XCTAssertEqual("5445 Wilkins", viewModel.addr_line1())
    }
    
    func test_addrLine2() {
        XCTAssertEqual("N/A", viewModel.addr_line2)
    }
    
    func test_city(){
        XCTAssertEqual("Pittsburgh", viewModel.city)
    }
    
    func test_state(){
        XCTAssertEqual("PA", viewModel.state)
    }
    
    func test_zipcode(){
        XCTAssertEqual("15217", viewModel.zipcode)
    }
    
    func test_rent(){
        XCTAssertEqual(3900, viewModel.rent)
    }
    
    func test_startDate(){
        XCTAssertEqual("6/1/2018", viewModel.start_date)
    }
    
    func test_endDate(){
        XCTAssertEqual("6/2/2019", viewModel.end_date)
    }

    
    
}


