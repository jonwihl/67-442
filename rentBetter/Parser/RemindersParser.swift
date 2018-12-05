//
//  RemindersParser.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation


class RemindersParser {
	
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
	
	
	func remindersFromSearchResponse(_ data: Data?) -> [Reminder]? {
		guard let dict = parseDictionary(data) else {
			print("Error: couldn't parse dictionary from data")
			return nil
		}
		
		//		guard let maintenanceDicts = dict["maintenances"] as? [JSONDictionary] else {
		//			print("Error: couldn't parse maintenances from JSON: \(dict)")
		//			return nil
		//		}
		
		return dict.compactMap { parseReminder($0) }
	}
	
	
	
	func parseReminder(_ dict: JSONDictionary) -> Reminder? {
		if let id = dict["id"] as? Int,
			let title = dict["title"] as? String,
			let description = dict["description"] as? String,
			let created_on = dict["created_on"] as? String,
			let removed_on = dict["removed_on"] as? String,
			let active = dict["active"] as? Bool,
			let landlord_id = dict["landlord_id"] as? Int,
			let property_id = dict["property_id"] as? Int{
			//			display only the active maintenances
			if active == true{
				let reminder = Reminder(id: id, title: title, description: description,
																			created_on: created_on, removed_on: removed_on,
																			active: active, landlord_id: landlord_id, property_id:property_id)
				return reminder
			}
		}
		else {
			print("Error: couldn't parse JSON dictionary: \(dict)")
		}
		return nil
	}
}
