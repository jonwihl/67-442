//
//  Property.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 10/31/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

public class Property{
    var addr_1: String
//    var addr_2: String?
//    var street: String
//    var zipcode: String
//    var city: String
//    var state: String
    var rent: String?
//    var start_date: Date
//    var end_date: Date
    
    init(addr_1: String, rent: String) {
        self.addr_1 = addr_1
        self.rent = rent
    }
}
