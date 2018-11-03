//
//  Maintenance.swift
//  rentBetter
//
//  Created by Arnav Jain on 10/30/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Photos
import UIKit

struct Maintenance {
	var title: String
	var description: String?
    var created_on: String
	var photo: String?
    
    init(title: String, created_on:String) {
        self.title = title
        self.created_on = created_on
    }
    
}
