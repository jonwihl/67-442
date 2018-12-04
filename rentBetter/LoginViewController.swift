//
//  ViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 10/30/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    
    override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.view.backgroundColor = UIColor(red: 76/100, green: 94/100, blue: 92/100, alpha: 1)
//        passwordField.text = "  Password"
        passwordField.textColor = UIColor.lightGray
//        userNameField.text = "  Username"
        userNameField.textColor = UIColor.lightGray
	}
}

