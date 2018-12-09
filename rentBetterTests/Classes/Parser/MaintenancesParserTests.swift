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
        let data = loadJSONTestData("dataM")
        let results = maintenancesParser.parseDictionary(data)
        XCTAssertNotNil(results)
    }

    func test_maintenancesFromSearchResponse()  {
        let data = loadJSONTestData("dataM")
        let results = maintenancesParser.maintenancesFromSearchResponse(data)
        XCTAssertEqual(5, results!.count)

        let first = results!.first!
        XCTAssertEqual(1, first.id)
        XCTAssertEqual("Broken Sink", first.title)
        XCTAssertEqual("Our sink is currently not working. We think the drain might be blocked because the water is very slow to drain, and this is making it hard to use the sink.", first.description)
        XCTAssertEqual("2018-12-07", first.created_on)
        XCTAssertEqual("", first.closed_on)
        XCTAssertEqual("", first.photo)
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
//
	
}
