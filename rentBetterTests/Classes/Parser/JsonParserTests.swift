//
//  JsonParserTests.swift
//  rentBetterTests
//
//  Created by Jonathan Wihl on 11/12/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import XCTest
@testable import rentBetter 

class JsonParserTests: XCTestCase {
    
    func testJsonParser(){
        let jsontest = JsonParser()
        let maintenances = jsontest.parseJson()
        let maintenance = maintenances[0]
        XCTAssertEqual(maintenance.title, "broken sink")
        
    }


}
