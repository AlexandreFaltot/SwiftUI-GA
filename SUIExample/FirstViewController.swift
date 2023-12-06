//
//  FirstViewController.swift
//  SUIExample
//
//  Created by Alexandre FALTOT on 06/12/2023.
//

import SwiftUI

struct FirstViewController: View {
	@StateObject var viewModel: FirstViewModel

	// MARK: - body
	var body: some View {
		VStack(alignment: .leading) {
			header
			Spacer()
			MyTextField(text: $viewModel.text, 
						model: viewModel.textFieldModel)
			Spacer()
			footer
		}
		.padding(Margins.large)
		.navigationTitle(Text(viewModel.navBarTitle))
	}

	private var header: some View {
		VStack(alignment: .leading, spacing: Margins.large) {
			Text(viewModel.title)
				.style(.title1)
			Text(viewModel.subtitle)
				.style(.title2)
		}
	}

	private var footer: some View {
		Group {
			MyButton(model: MyButtonModel(style: .primary,
										  title: viewModel.validateButtonText),
					 enabled: viewModel.buttonEnabled,
					 onClick: { viewModel.validate() })
			MyButton(model: MyButtonModel(style: .secondary,
										  title: "second button"),
					 enabled: viewModel.buttonEnabled,
					 onClick: { viewModel.validate() })
		}
	}
}

class FirstViewModel: ObservableObject {
	@Published var text: String = ""
	var onDone: ((String) -> Void)?

	var navBarTitle: String {
		return "SwiftUI MVVM"
	}

	var title: String {
		return "Number selector"
	}

	var subtitle: String {
		return "With astonishing design !"
	}
	var textFieldModel: MyTextFieldModel {
		MyTextFieldModel(placeholder: "Your coolest number here",
						 title: "Set a number:",
						 formatter: NumberTextFieldFormatter())
	}

	var validateButtonText: String {
		return "Validate"
	}

	var buttonEnabled: Bool {
		return !text.isEmpty
	}

	init(onDone: ((String) -> Void)? = nil) {
		self.onDone = onDone
	}

	func validate() {
		onDone?(text)
	}
}


#Preview {
	FirstViewController(viewModel: FirstViewModel())
}
