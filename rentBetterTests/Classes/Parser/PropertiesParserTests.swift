//
//  PropertiesParserTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 11/3/18.
//  Copyright © 2018 AJ. All rights reserved.
//


import XCTest
@testable import rentBetter

class PropertiesParserTests: XCTestCase {
	
	let propertiesParser = PropertiesParser()
	
	
	
	func test_parseDictionary() {
		let data = loadJSONTestData("data")
		let results = propertiesParser.parseDictionary(data)
		
		XCTAssertNotNil(results)
	}
	
	
	func test_propertiesFromSearchResponse()  {
		let data = loadJSONTestData("data")
		let results = propertiesParser.propertiesFromSearchResponse(data)
		XCTAssertEqual(3, results!.count)
		
		let first = results!.first!
		XCTAssertEqual(1, first.id)
		XCTAssertEqual("5445 Wilkins Ave", first.addr_line1)
		XCTAssertEqual("Pittsburgh", first.city)
		XCTAssertEqual("PA", first.state)
		XCTAssertEqual("15217", first.zipcode)
		XCTAssertEqual("3900", first.rent)
		XCTAssertEqual("6/1/2018", first.start_date)
		XCTAssertEqual("6/1/2019", first.end_date)
		XCTAssertEqual(1, first.landlord_id)
	}
	
	
	func test_propertiesFromSearchResponse_with_nil_data(){
		let data: Data? = nil
		let results = propertiesParser.propertiesFromSearchResponse(data)
		XCTAssertNil(results)
	}
	
	
	
	
	func loadJSONTestData(_ filename: String) -> Data? {
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: filename, ofType: "json")
		return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
	}
	
	
}
