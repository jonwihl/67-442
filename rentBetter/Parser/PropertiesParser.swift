//
//  PropertiesParser.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/3/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]

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
	
	
	
	func repositoriesFromSearchResponse(_ data: Data?) -> [Property]? {
		guard let dict = parseDictionary(data) else {
			print("Error: couldn't parse dictionary from data")
			return nil
		}
		
		guard let propDicts = dict["properties"] as? [JSONDictionary] else {
			print("Error: couldn't parse items from JSON: \(dict)")
			return nil
		}
		
		return propDicts.compactMap { parseProperty($0) }
	}
	
	
	
	
	func parseProperty(_ dict: JSONDictionary) -> Property? {
		if let addr_1 = dict["addr_1"] as? String,
			let name = dict["name"] as? String,
			let description = dict["description"] as? String {
			let htmlURL = dict["html_url"] as? String
			let repo = Repository(id: id, name: name, description: description, htmlURL: htmlURL)
			return repo
		} else {
			print("Error: couldn't parse JSON dictionary: \(dict)")
		}
		return nil
	}
}

