//
//  OnBoardingFlowView.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//


//  OnboardingFlowView.swift
//  Domory

import SwiftUI

enum OnboardingStep {
	case welcome
	case sleepPermission
	case soundPermission
	case notificationPermission
}

struct OnboardingFlowView: View {
	var onFinish: () -> Void
	
	@State private var step: OnboardingStep = .welcome

	var body: some View {
		ZStack {
			switch step {
			case .welcome:
				OnboardingView(onContinue: { step = .sleepPermission })
			case .sleepPermission:
				SleepAskView(onContinue: { step = .soundPermission })
			case .soundPermission:
				SoundPermissionView(onContinue: { step = .notificationPermission })
			case .notificationPermission:
				NotificationPermissionView(onContinue: {
//					 mark onboarding complete
					onFinish()
				})
			}
		}
		.animation(.easeInOut, value: step)
	}
}

#Preview {
	OnboardingFlowView() {
		
	}
}
