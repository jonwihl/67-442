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
import Toast_Swift

class PaymentViewController: UIViewController {
	
	@IBOutlet weak var paymentAmount: UITextField!
	@IBOutlet weak var memo: UITextField!
	
	var style = ToastStyle()
	
//	style.messageColor = .blue
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.makeToast("Payment", duration: 15.0, position: .bottom, title: "Use this page to enter in a payment amount and memo, then continue") { didTap in
			if didTap {
				print("completion from tap")
			} else {
				print("completion without tap")
			}
		}

		
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
				
				let alertController = UIAlertController(title: "Success!",
																								message: "Your payment of $\(self.paymentAmount.text!) for \(self.memo.text) was successful!",
																								preferredStyle: .alert)
				let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
					self.navigationController?.popViewController(animated: true)
				})
				alertController.addAction(alertAction)
				self.present(alertController, animated: true)
			// 2
			case .failure(let error):
				let alertController = UIAlertController(title: "Success!",
																								message: "Your payment of $\(self.paymentAmount.text!) for \(self.memo.text!) was successful!",
					preferredStyle: .alert)
				let alertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
					self.navigationController?.popViewController(animated: true)
				})
				alertController.addAction(alertAction)
				self.present(alertController, animated: true)
			}
		}
	}
}
