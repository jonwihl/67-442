//
//  MaintenancesParser.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/3/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

//typealias JSONDictionary = [String: AnyObject]


class MaintenancesParser {
	
	func parseDictionary(_ data: Data?) -> JSONArray? {
		do {
			if let data = data,
				let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSONArray {
				return json
			}
		} catch {
			print("Couldn't parse JSON. Error: \(error)")
		}
		return nil
	}

	
	func maintenancesFromSearchResponse(_ data: Data?) -> [Maintenance]? {
		guard let dict = parseDictionary(data) else {
			print("Error: couldn't parse dictionary from data")
			return nil
		}
		
//		guard let maintenanceDicts = dict["maintenances"] as? [JSONDictionary] else {
//			print("Error: couldn't parse maintenances from JSON: \(dict)")
//			return nil
//		}
		
		return dict.compactMap { parseRepository($0) }
	}
	
	
	
	func parseRepository(_ dict: JSONDictionary) -> Maintenance? {
		if let id = dict["id"] as? Int,
			let title = dict["title"] as? String,
			let description = dict["description"] as? String,
			let created_on = dict["created_on"] as? String,
			let closed_on = dict["closed_on"] as? String,
			let photo = dict["photo"] as? String,
			let active = dict["active"] as? Bool {
				let maintenance = Maintenance(id: id, title: title, description: description,
																			created_on: created_on, closed_on: closed_on,
																			photo: photo, active: active)
				return maintenance
			}
		else {
			print("Error: couldn't parse JSON dictionary: \(dict)")
		}
		return nil
	}
}
