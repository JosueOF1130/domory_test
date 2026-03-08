//
//  WithIcon.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//

import SwiftUI

enum IconPosition {
	case left
	case right
	case center
}

enum ButtonStyle {
	case primary
	case secondary
}

struct IconButton: View {
	
	let title: String
	let icon: Image?
	let iconPosition: IconPosition
	let buttonStyle: ButtonStyle
	let action: () -> Void
	
	init(
			title: String,
			icon: Image? = nil,
			iconPosition: IconPosition = .left,
			buttonStyle: ButtonStyle = .primary, // default!
			action: @escaping () -> Void
		) {
			self.title = title
			self.icon = icon
			self.iconPosition = iconPosition
			self.buttonStyle = buttonStyle
			self.action = action
		}
	
	var body: some View {
		Button(action: action) {
			HStack {
				if iconPosition == .left {
					icon
				}
				Spacer()
				Text(title)
					.font(.paragraph(weight: .bold))
				if iconPosition == .center {
					icon
				}
				Spacer()
				if iconPosition == .right{
					icon
				}

			}
			.foregroundStyle(.white)
			.padding()
			.frame(maxWidth: .infinity)
			.background(
				buttonStyle == .primary
						? Color.App.primary
						: Color.App.secondary
				)
			.cornerRadius(30)
		}
	}
}
