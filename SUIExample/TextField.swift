//
//  FirstViewController.swift
//  SUIExample
//
//  Created by Alexandre FALTOT on 06/12/2023.
//

import SwiftUI

struct MyTextField: View {
	@Binding var text: String
	@StateObject var model: MyTextFieldModel

	init(text: Binding<String>, model: MyTextFieldModel) {
		self._text = text
		self._model = StateObject(wrappedValue: model)
	}

	var body: some View {
		VStack(alignment: .leading, spacing: Margins.small) {
			Text(model.title)
				.style(.paragraph)
			TextField(model.placeholder, text: $text)
		}
		.onChange(of: text) {
			text = model.formatText(text)
		}
	}
}

class MyTextFieldModel: ObservableObject {
	let placeholder: String
	let title: String
	let formatter: TextFieldFormatter

	init(placeholder: String, title: String, formatter: TextFieldFormatter) {
		self.placeholder = placeholder
		self.title = title
		self.formatter = formatter
	}

	func formatText(_ text: String) -> String {
		return formatter.format(string: text)
	}
}


#Preview {
	FirstViewController(viewModel: FirstViewModel())
}
