//
//  SearchPropertiesClient.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/3/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation
import Alamofire

class SearchPropertiesClient {
	func fetchProperties(_ completion: @escaping (Data?) -> Void) {
		
		let urlString = "https://api.myjson.com/bins/wir3m"
		
		Alamofire.request(urlString).response { response in
			if let error = response.error {
				print("Error fetching properties: \(error)")
				completion(response.data)
				return
			}
			completion(response.data)
		}
		
	}
}
