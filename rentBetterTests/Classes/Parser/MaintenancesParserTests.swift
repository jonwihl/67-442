//
//  PropertiesParserTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 11/3/18.
//  Copyright © 2018 AJ. All rights reserved.
//


import XCTest
@testable import rentBetter

class MaintenancesParserTests: XCTestCase {
	
	let maintenancesParser = MaintenancesParser()
    
    func test_parseDictionary() {
        let data = loadJSONTestData("data")
        let results = maintenancesParser.parseDictionary(data)
        XCTAssertNotNil(results)
    }

    func test_maintenancesFromSearchResponse()  {
        let data = loadJSONTestData("data")
        let results = maintenancesParser.maintenancesFromSearchResponse(data)
        XCTAssertEqual(2, results!.count)

        let first = results!.first!
        XCTAssertEqual(1, first.id)
        XCTAssertEqual("Broken sink", first.title)
        XCTAssertEqual("The sink is broken", first.description)
        XCTAssertEqual("11/1/2018", first.created_on)
        XCTAssertEqual("11/3/2018", first.closed_on)
        XCTAssertEqual("xyz", first.photo)
        XCTAssertEqual(true, first.active)
    }

    func test_propertiesFromSearchResponse_with_nil_data(){
        let data: Data? = nil
        let results = maintenancesParser.maintenancesFromSearchResponse(data)
        XCTAssertNil(results)
    }

    func loadJSONTestData(_ filename: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
	
	
}
