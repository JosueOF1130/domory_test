//
//  AuthFlow.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//
//  AuthFlowView.swift
//  Domory

import SwiftUI

enum AuthStep {
	case login
	case signUp
}

struct AuthFlowView: View {
	var onFinish: () -> Void
	@State private var step: AuthStep = .login

	var body: some View {
		ZStack {
			switch step {
			case .login:
				LoginView(
					onLogin: { onFinish() },
					onGoToSignUp: { step = .signUp }
				)
			case .signUp:
				SignUpView(
					onSignUp: { onFinish() },
					onGoToLogin: { step = .login }
				)
			}
		}
		.animation(.easeInOut, value: step)
	}
}

#Preview {
	AuthFlowView(onFinish: {})
}
