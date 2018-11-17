//
//  PropertiesParser.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/3/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

//typealias JSONDictionary = [String: AnyObject]

class PropertiesParser {
	
	
	func parseDictionary(_ data: Data?) -> JSONDictionary? {
		do {
			if let data = data,
				let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary {
				return json
			}
		} catch {
			print("Couldn't parse JSON. Error: \(error)")
		}
		return nil
	}
	
	
	
	func propertiesFromSearchResponse(_ data: Data?) -> [Property]? {
		guard let dict = parseDictionary(data) else {
			print(parseDictionary(data)!)
			print("Error: couldn't parse dictionary from data")
			return nil
		}
		
		guard let propDicts = dict["properties"] as? [JSONDictionary] else {
			print("Error: couldn't parse properties from JSON: \(dict)")
			return nil
		}
		
		return propDicts.compactMap { parseProperty($0) }
	}
	
	
	
	
	func parseProperty(_ dict: JSONDictionary) -> Property? {
		if let id = dict["id"] as? Int,
			let addr_line1 = dict["addr_line1"] as? String,
			let addr_line2 = dict["addr_line2"] as? String,
			let city = dict["city"] as? String,
			let state = dict["state"] as? String,
			let zipcode = dict["zipcode"] as? String,
			let rent = dict["rent"] as? String,
			let start_date = dict["start_date"] as? String,
			let end_date = dict["end_date"] as? String,
			let active = dict["active"] as? Bool {
            let landlord_id = dict["landlord_id"] as? Int
			let prop = Property(id: id, addr_line1: addr_line1, addr_line2: addr_line2, city: city,
                                state: state, zipcode: zipcode, rent: rent, start_date: start_date, end_date: end_date,active: active, landlord_id: landlord_id!)
				return prop
			
		} else {
				print("Error: couldn't parse JSON dictionary: \(dict)")
		}
		return nil
	}
}

