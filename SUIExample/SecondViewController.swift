//
//  SecondViewController.swift
//  SUIExample
//
//  Created by Alexandre FALTOT on 06/12/2023.
//

import SwiftUI

struct SecondViewController: View {
	@StateObject var viewModel: SecondViewModel

	// MARK: - body
	var body: some View {
		VStack(spacing: Margins.large) {
			Spacer()
			Text("Your number : \(viewModel.writtenText)")
			Spacer()
		}
		.navigationTitle(Text(viewModel.navBarTitle))
	}
}

class SecondViewModel: ObservableObject {
	let writtenText: String

	var navBarTitle: String {
		return "SwiftUI MVVM 2"
	}

	init(writtenText: String) {
		self.writtenText = writtenText
	}
	
}

typealias VoidCallback = () -> Void

#Preview {
	SecondViewController(viewModel: SecondViewModel(writtenText: "Written text"))
}
