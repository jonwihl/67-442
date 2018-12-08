//
//  TenantReminderDetailViewModel.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class TenantReminderDetailViewModel {
    var reminder: Reminder
    
    init(reminder: Reminder) {
        self.reminder = reminder
    }
    
    func id() -> Int {
        return reminder.id
    }
    
    func title() -> String {
        return reminder.title
    }
    
    func description() -> String? {
        return reminder.description
    }
    
    func created_on() -> String? {
        return reminder.created_on
    }
    
    func removed_on() -> String? {
        return reminder.removed_on
    }
}
