//
//  TenantRemindersViewController.swift
//  rentBetter
//
//  Created by Jonathan Wihl on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class TenantRemindersViewController: UITableViewController {
    
    let viewModel = TenantRemindersViewModel()
    @IBOutlet var remindersTable: UITableView!
    
    @IBAction func refresh(_ sender: Any) {
        viewModel.refresh {
            [unowned self] in
            DispatchQueue.main.async {
                self.remindersTable.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.remindersTable.register(UINib(nibName: "ReminderViewCell", bundle: nil), forCellReuseIdentifier: "ReminderCell")
        viewModel.refresh { [unowned self] in
            DispatchQueue.main.async {
                self.remindersTable.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
        
        tabBarController?.tabBar.barTintColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as! ReminderViewCell
        cell.titleLabel?.text = viewModel.titleForRowAtIndexPath(indexPath)
				cell.summaryLabel?.text = viewModel.summaryForRowAtIndexPath(indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TenantRVC", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? TenantReminderDetailViewController,
            let indexPath = sender as? IndexPath {
            detailVC.viewModel = viewModel.detailViewModelForRowAtIndexPath(indexPath)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
