//
//  Text+Helper.swift
//  SUIExample
//
//  Created by Alexandre FALTOT on 06/12/2023.
//

import SwiftUI

extension Text {
	func style(_ textStyle: TextStyle) -> some View {
		return font(textStyle.font)
			.fontWeight(textStyle.weight)
	}
}

enum TextStyle {
	case paragraph, title1, title2

	var font: Font {
		switch self {
		case .paragraph: return .system(size: 12)
		case .title1: return .system(size: 20)
		case .title2: return .system(size: 16)
		}
	}

	var weight: Font.Weight {
		switch self {
		case .paragraph: return .regular
		case .title1: return .bold
		case .title2: return .semibold
		}
	}
}
