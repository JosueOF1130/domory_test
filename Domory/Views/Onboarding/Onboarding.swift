//  OnboardingView.swift
//  Domory

import SwiftUI

struct OnboardingView: View {
	var onContinue: () -> Void   // ← replaces @State showNextScreen

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

			VStack {
				VStack(alignment: .leading, spacing: 4) {
					Text("Retain")
						.font(.customHeading(weight: .bold))
						.foregroundStyle(Color.App.primaryText)
					Text("brain power with")
						.font(.customHeading(weight: .light))
						.foregroundStyle(Color.App.primaryText)
					Text("\(Text("Quick").font(.customHeading(weight: .bold))) exercises")
						.font(.customHeading(weight: .light))
						.foregroundStyle(Color.App.primaryText)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(20)

				Spacer()

				IconButton(
					title: "Continue",
					icon: Image(systemName: "arrow.right"),
					iconPosition: .right
				) {
					onContinue()   // ← calls the step forward
				}
				.padding()
			}
		}
	}
}
