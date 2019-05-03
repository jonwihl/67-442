//
//  RemindersParserTests.swift
//  rentBetterTests
//
//  Created by Arnav Jain on 12/9/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

import XCTest
@testable import rentBetter

class RemindersParserTests: XCTestCase {
	
	let remindersParser = RemindersParser()
	
	func test_parseDictionary() {
		let data = loadJSONTestData("dataR")
		let results = remindersParser.parseDictionary(data)
		XCTAssertNotNil(results)
	}
	
	func test_remindersFromSearchResponse()  {
		let data = loadJSONTestData("dataR")
		let results = remindersParser.remindersFromSearchResponse(data)
		XCTAssertEqual(3, results!.count)
		
		let first = results!.first!
		XCTAssertEqual("Trash Day", first.title)
		XCTAssertEqual("Reminder that tomorrow is trash day! Be sure to put all of your trash bags on the curb tonight so that they get picked up tomorrow morning. ", first.description)
		XCTAssertEqual("2018-12-07", first.created_on)
		XCTAssertEqual("", first.removed_on)
		XCTAssertEqual(true, first.active)
	}
	
	func test_remindersFromSearchResponse_with_nil_data(){
		let data: Data? = nil
		let results = remindersParser.remindersFromSearchResponse(data)
		XCTAssertNil(results)
	}
	
	func loadJSONTestData(_ filename: String) -> Data? {
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: filename, ofType: "json")
		return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
	}
	//
	
}
