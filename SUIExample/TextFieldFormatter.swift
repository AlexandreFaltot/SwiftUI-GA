//
//  FirstViewController.swift
//  SUIExample
//
//  Created by Alexandre FALTOT on 06/12/2023.
//

import SwiftUI

protocol TextFieldFormatter {
	func format(string: String) -> String
}

class NumberTextFieldFormatter: TextFieldFormatter {
	let formatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.usesGroupingSeparator = true
		return formatter
	}()

	func format(string: String) -> String {
		let cleanString = string.replacing(/[^0-9]/, with: "")
		guard !cleanString.isEmpty else { return "" }
		let number = Int(cleanString) ?? 0
		return formatter.string(from: number as NSNumber) ?? string
	}
}

#Preview {
	FirstViewController(viewModel: FirstViewModel())
}
