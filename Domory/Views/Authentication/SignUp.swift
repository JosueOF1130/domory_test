//
//  SignUp.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//


//  SignUpView.swift
//  Domory

import SwiftUI

struct SignUpView: View {
	var onSignUp: () -> Void
	var onGoToLogin: () -> Void

	@State private var email = ""
	@State private var password = ""
	@State private var confirmPassword = ""

	var body: some View {
		VStack {
			Text("Sign Up")

			TextField("Email", text: $email)
			SecureField("Password", text: $password)
			SecureField("Confirm Password", text: $confirmPassword)

			Button("Create Account") {
				onSignUp()
			}

			Button("Already have an account? Log In") {
				onGoToLogin()
			}
		}
		.padding()
	}
}

#Preview {
	SignUpView(onSignUp: {}, onGoToLogin: {})
}
