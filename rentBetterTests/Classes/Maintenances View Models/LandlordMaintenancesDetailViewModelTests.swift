//
//  LandlordPropertiesDetailViewModelTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 11/4/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import XCTest
@testable import rentBetter

class LandlordMaintenancesDetailViewModelTests: XCTestCase {
    
    func test_title() {
        let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", active: true, photo: "xyz")
        let viewModel = LandlordMaintenancesDetailViewModel(maintenance: main)
        XCTAssertEqual("Sink not running", viewModel.title())
    }
    
    func test_description(){
        let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", active: true, photo: "xyz")
        let viewModel = LandlordMaintenancesDetailViewModel(maintenance: main)
        XCTAssertEqual("no water is coming out of the kitchen sink", viewModel.description())
    }
    
    func test_createdOn(){
        let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", active: true, photo: "xyz")
        let viewModel = LandlordMaintenancesDetailViewModel(maintenance: main)
        XCTAssertEqual("10/15/2018", viewModel.created_on())
    }
    
    func test_closedOn(){
        let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", active: true, photo: "xyz")
        let viewModel = LandlordMaintenancesDetailViewModel(maintenance: main)
        XCTAssertEqual("10/20/2018", viewModel.closed_on())
    }
    
    func test_photo(){
        let main = Maintenance(id: 1, title: "Sink not running", description: "no water is coming out of the kitchen sink", created_on: "10/15/2018", closed_on: "10/20/2018", active: true, photo: "xyz")
        let viewModel = LandlordMaintenancesDetailViewModel(maintenance: main)
        XCTAssertEqual("xyz", viewModel.photo())
    }
    
}



