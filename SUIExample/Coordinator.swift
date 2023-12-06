//
//  Coordinator.swift
//  SUIExample
//
//  Created by Alexandre FALTOT on 06/12/2023.
//

import Foundation
import UIKit
import SwiftUI

class Coordinator {
	let navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let view = FirstViewController(viewModel: FirstViewModel(onDone: { [weak self] text in
			self?.goToSecondController(text: text)
		}))
		navigationController.pushSwiftUIController(view: view)
	}

	func goToSecondController(text: String) {
		let view = SecondViewController(viewModel: SecondViewModel(writtenText: text))
		navigationController.pushSwiftUIController(view: view)
	}
}

extension UINavigationController {
	func pushSwiftUIController(view: some View) {
		pushViewController(UIHostingController(rootView: view), animated: true)
	}
}
