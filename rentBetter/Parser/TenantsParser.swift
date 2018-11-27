//
//  TenantsParser.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class TenantsParser {
	
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
	
	
	
	func tenantsFromSearchResponse(_ data: Data?) -> [Tenant]? {
		guard let dict = parseDictionary(data) else {
			print("Error: couldn't parse dictionary from data")
			return nil
		}
		
		
		return dict.compactMap { parseTenant($0) }
	}
	
	
	
	
	func parseTenant(_ dict: JSONDictionary) -> Tenant? {
		if let id = dict["id"] as? Int,
			let name = dict["name"] as? String,
			let phone = dict["phone"] as? String,
			let username = dict["username"] as? String,
			let password_digest = dict["password_digest"] as? String,
			let active = dict["active"] as? Bool,
			let property_id = dict["property_id"] as? Int{
			let tenant = Tenant(id: id, name: name, phone: phone, username: username,
													password_digest: password_digest, active: active, property_id: property_id)
			return tenant
			
		} else {
			print("Error: couldn't parse JSON dictionary: \(dict)")
		}
		return nil
	}
}

