//
//  SleepAsk.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//

//  SleepPermissionView.swift
//  Domory

import SwiftUI

struct SleepAskView: View {
	var onContinue: () -> Void
	@State private var sleepTrackingEnabled: Bool? = nil

	var body: some View {
		ZStack {
			LinearGradient(
				colors: [Color(hex: "#5681E2"), Color(hex: "#36477E"), Color(hex: "#1C172C")],
				startPoint: .topLeading,
				endPoint: .bottomTrailing
			)
			.ignoresSafeArea()

			Image("light_logo")
				.resizable()
				.scaledToFit()
				.frame(width: 331)
				.opacity(0.15)
				.offset(x: 90, y: 75)
				.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)

			VStack(alignment: .leading, spacing: 0) {

				VStack(alignment: .leading, spacing: 4) {
					Text("Sleep affects")
						.font(.customHeading(weight: .light))
						.foregroundStyle(Color.App.primaryText)
					Text("your memory.")
						.font(.customHeading(weight: .bold))
						.foregroundStyle(Color.App.primaryText)
				}
				.padding(20)

				Text("Domory can track your sleep hours to show how rest impacts your cognitive performance.")
					.font(.body)
					.foregroundStyle(Color.App.primaryText.opacity(0.75))
					.padding(.horizontal, 20)
					.padding(.top, 12)

				Spacer()

				VStack(spacing: 12) {
					// Enable button
					IconButton(
						title: "Enable Sleep Tracking",
						icon: Image(systemName: "moon.fill"),
						iconPosition: .left
					) {
						sleepTrackingEnabled = true
						onContinue()
					}

					// Skip button
					Button {
						sleepTrackingEnabled = false
						onContinue()
					} label: {
						Text("Skip for now")
							.font(.subheadline)
							.foregroundStyle(Color.App.primaryText.opacity(0.6))
							.frame(maxWidth: .infinity)
							.padding(.vertical, 12)
					}
				}
				.padding()
			}
		}
	}
}

#Preview {
	SleepAskView(onContinue: {})
}
