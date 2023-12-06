//
//  FirstViewController.swift
//  SUIExample
//
//  Created by Alexandre FALTOT on 06/12/2023.
//

import SwiftUI

struct MyButton: View {
	var model: MyButtonModel
	var enabled: Bool
	var onClick: () -> Void

	var body: some View {
		Button {
			onClick()
		} label: {
			Text(model.title)
				.style(model.textStyle)
				.foregroundStyle(model.textColor)
				.frame(maxWidth: .infinity, minHeight: Sizes.button)
				.background(model.backgroundColor)
				.border(Color.black, width: model.borderWidth)
		}
		.disabled(!enabled)
	}
}

struct MyButtonModel {
	enum Style {
		case primary, secondary
	}

	var style: Style
	var title: String

	var borderWidth: CGFloat {
		switch style {
		case .primary: return 0.0
		case .secondary: return 1.0
		}
	}

	var textStyle: TextStyle {
		switch style {
		case .primary: return .title2
		case .secondary: return .paragraph
		}
	}

	var textColor: Color {
		switch style {
		case .primary: return .white
		case .secondary: return .purple
		}
	}

	var backgroundColor: Color {
		switch style {
		case .primary: return .purple
		case .secondary: return .white
		}
	}
}
