//
//  Primary.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//

import SwiftUI

struct PrimaryButton: View {
	
	let title: String
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			Text(title)
				.font(.paragraph(weight: .bold))
				.foregroundStyle(.white)
				.frame(maxWidth: .infinity)
				.padding()
				.background(Color.App.primary)
				.cornerRadius(30)
		}
	}
}
