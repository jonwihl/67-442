//
//  Reminders.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation


struct Reminder{
    let id:Int
    let title:String
    let description:String
    let created_on:Date
    let removed_on:Date
    let active: Bool
    let landlord_id: Int
    let property_id: Int
}
