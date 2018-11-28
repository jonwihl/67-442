//
//  SearchRemindersClient.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation
import Alamofire

class SearchRemindersClient {
	func fetchReminders(_ completion: @escaping (Data?) -> Void) {
		
		let urlString = "https://protected-gorge-28359.herokuapp.com/reminders"
		
		Alamofire.request(urlString).response { response in
			if let error = response.error {
				print("Error fetching tenants: \(error)")
				completion(response.data)
				return
			}
			completion(response.data)
		}
		
	}
}

