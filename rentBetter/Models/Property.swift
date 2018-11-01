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
    var addr_2: String?
    var street: String
    var zipcode: String
    var city: String
    var state: String
    var rent: String?
    var start_date: String
    var end_date: String
    
    init(addr_1: String, street:String, zipcode:String, city:String, state:String, rent: String, start_date: String, end_date: String) {
        self.addr_1 = addr_1
        self.rent = rent
        self.street = street
        self.zipcode = zipcode
        self.city = city
        self.state = state
        self.start_date = start_date
        self.end_date = end_date
    }
}
