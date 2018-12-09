//
//  TenantsParserTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 12/9/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

import XCTest
@testable import rentBetter

class TenantsParserTests: XCTestCase {
	
	let tenantsParser = TenantsParser()
	
	func test_parseDictionary() {
		let data = loadJSONTestData("dataT")
		let results = tenantsParser.parseDictionary(data)
		XCTAssertNotNil(results)
	}
	
	func test_tenantsFromSearchResponse()  {
		let data = loadJSONTestData("dataT")
		let results = tenantsParser.tenantsFromSearchResponse(data)
		XCTAssertEqual(10, results!.count)
		
		let first = results!.first!
		XCTAssertEqual(1, first.id)
		XCTAssertEqual("Jonathan", first.name)
		XCTAssertEqual("6176105413", first.phone)
		XCTAssertEqual("jonwihl", first.username)
		XCTAssertEqual(true, first.active)
	}
	
	func test_remindersFromSearchResponse_with_nil_data(){
		let data: Data? = nil
		let results = tenantsParser.tenantsFromSearchResponse(data)
		XCTAssertNil(results)
	}
	
	func loadJSONTestData(_ filename: String) -> Data? {
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: filename, ofType: "json")
		return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
	}
	//
	
}

