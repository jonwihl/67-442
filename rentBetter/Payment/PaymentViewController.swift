//
//  PaymentViewController.swift
//  rentBetter
//
//  Created by Arnav Jain on 11/27/18.
//  Copyright © 2018 AJ. All rights reserved.
//

import Foundation
import UIKit
import Stripe

class PaymentViewController: UIViewController {
	
	@IBOutlet weak var paymentAmount: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Payment"
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
	}
	
	@IBAction func continuePayment(_ sender: Any) {
		print("X")
		let addCardViewController = STPAddCardViewController()
		addCardViewController.delegate = self
		navigationController?.pushViewController(addCardViewController, animated: true)
	}
	
	
	
}

extension PaymentViewController: STPAddCardViewControllerDelegate {
	
	func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
		navigationController?.popViewController(animated: true)
	}
	
	func addCardViewController(_ addCardViewController: STPAddCardViewController,
														 didCreateToken token: STPToken,
														 completion: @escaping STPErrorBlock) {
		StripeClient.shared.completeCharge(with: token, amount: Int((paymentAmount?.text!)!)!) { result in
			switch result {
			// 1
			case .success:
				completion(nil)
				
				let alertController = UIAlertController(title: "Congrats",
																								message: "Your payment was successful!",
																								preferredStyle: .alert)
				let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
					self.navigationController?.popViewController(animated: true)
				})
				alertController.addAction(alertAction)
				self.present(alertController, animated: true)
			// 2
			case .failure(let error):
				completion(error)
			}
		}
	}
}
