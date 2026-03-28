//
//  SoundPermission.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//

//  SoundPermissionView.swift
//  Domory

import SwiftUI

struct SoundPermissionView: View {
	var onContinue: () -> Void
	@AppStorage("soundEnabled") private var soundEnabled: Bool = true

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
					Text("Sound makes")
						.font(.customHeading(weight: .regular))
						.foregroundStyle(Color.App.primaryText)
					Text("games better.")
						.font(.customHeading(weight: .bold))
						.foregroundStyle(Color.App.primaryText)
				}
				.padding(20)

				Text("Some memory games use audio cues. You can always change this later in your profile settings.")
					.font(.body)
					.foregroundStyle(Color.App.primaryText.opacity(0.75))
					.padding(.horizontal, 20)
					.padding(.top, 12)

				Spacer()

				VStack(spacing: 12) {
					IconButton(
						title: "Enable Sound",
						icon: Image(systemName: "speaker.wave.2.fill"),
						iconPosition: .left
					) {
						soundEnabled = true
						onContinue()
					}

					Button {
						soundEnabled = false
						onContinue()
					} label: {
						Text("Continue without sound")
							.font(.description())
							.foregroundStyle(Color.App.bodyText)
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
	SoundPermissionView(onContinue: {})
}
