//
//  RootView.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//

import Foundation
/*
 
 Domory
 │
 ├── App
 │   └── DomoryApp.swift
 │
 ├── Onboarding
 │   ├── OnboardingFlowView.swift
 │   ├── WelcomeView.swift
 │   ├── SleepPermissionView.swift
 │   ├── SoundPermissionView.swift
 │   └── NotificationPermissionView.swift
 │
 ├── Auth
 │   ├── LoginView.swift
 │   └── SignUpView.swift
 │
 ├── MainApp
 │   ├── HomeView.swift
 │   ├── GamesView.swift
 │   └── ProfileView.swift
 │
 ├── Models
 │
 ├── Components
 │
 └── Extensions
 
 */

//Example

import SwiftUI


struct RootView: View {

	@AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
	@AppStorage("isLoggedIn") private var isLoggedIn = false

	var body: some View {

		if !hasCompletedOnboarding {
			OnboardingFlowView(onFinish: {
				hasCompletedOnboarding = true
			})
		}
		else if !isLoggedIn {
			AuthFlowView(onFinish: {
				isLoggedIn = true
})	
		}
		else {
			HomeView()
		}

	}
}


#Preview {
	RootView()
		.onAppear {
					UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
					UserDefaults.standard.removeObject(forKey: "isLoggedIn")
				}
}
