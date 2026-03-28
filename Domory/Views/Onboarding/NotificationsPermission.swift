//
//  NotificationsPermission.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//

//  NotificationPermissionView.swift
//  Domory

import SwiftUI
import UserNotifications

struct NotificationPermissionView: View {
	var onContinue: () -> Void
	@AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = false

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
					Text("Stay on")
						.font(.customHeading(weight: .light))
						.foregroundStyle(Color.App.primaryText)
					Text("your streak.")
						.font(.customHeading(weight: .bold))
						.foregroundStyle(Color.App.primaryText)
				}
				.padding(20)

				Text("Get a gentle daily reminder to complete your memory session and keep your streak alive.")
					.font(.body)
					.foregroundStyle(Color.App.primaryText.opacity(0.75))
					.padding(.horizontal, 20)
					.padding(.top, 12)

				Spacer()

				VStack(spacing: 12) {
					IconButton(
						title: "Enable Reminders",
						icon: Image(systemName: "bell.fill"),
						iconPosition: .left
					) {
						requestNotificationPermission()
					}

					Button {
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

	private func requestNotificationPermission() {
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
			DispatchQueue.main.async {
				notificationsEnabled = granted
				onContinue()
			}
		}
	}
}

#Preview {
	NotificationPermissionView(onContinue: {})
}
