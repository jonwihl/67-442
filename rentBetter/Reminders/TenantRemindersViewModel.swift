//
//  TenantRemindersViewModel.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation

class TenantRemindersViewModel {
    
    var reminders = [Reminder]()
    var filteredReminders = [Reminder]()
    
    let client = SearchRemindersClient()
    let parser = RemindersParser()
    
    func refresh(_ completion: @escaping () -> Void) {
        client.fetchReminders{ [unowned self] data in
            if let reminder = self.parser.remindersFromSearchResponse(data) {
                self.reminders = reminder
            }
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        if filteredReminders.isEmpty {
            return reminders.count
        } else {
            return filteredReminders.count
        }
    }
    
    func titleForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < reminders.count else {
            return ""
        }
        if filteredReminders.isEmpty {
            return reminders[indexPath.row].title
        } else {
            return filteredReminders[indexPath.row].title
        }
    }
    
    func summaryForRowAtIndexPath(_ indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < reminders.count else {
            return ""
        }
        if filteredReminders.isEmpty {
            return reminders[indexPath.row].description
        } else {
            return filteredReminders[indexPath.row].description
        }
    }
    
    func detailViewModelForRowAtIndexPath(_ indexPath: IndexPath) -> TenantReminderDetailViewModel {
        let fix = (filteredReminders.isEmpty ? reminders[indexPath.row] : filteredReminders[indexPath.row])
        return TenantReminderDetailViewModel(reminder: fix)
    }
    
    func updateFiltering(_ searchText: String) -> Void {
        filteredReminders = self.reminders.filter { reminder in
            return reminder.title.lowercased().contains(searchText.lowercased())
        }
    }
    
}
