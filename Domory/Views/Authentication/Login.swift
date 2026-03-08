//
//  Login.swift
//  Domory Test
//
//  Created by Josue Orozco on 3/8/26.
//

//  LoginView.swift
//  Domory

import SwiftUI

struct LoginView: View {
	var onLogin: () -> Void
	var onGoToSignUp: () -> Void

	@State private var email = ""
	@State private var password = ""

	var body: some View {
		VStack {
			Text("Login")

			TextField("Email", text: $email)
			SecureField("Password", text: $password)

			Button("Log In") {
				onLogin()
			}

			Button("Don't have an account? Sign Up") {
				onGoToSignUp()
			}
		}
		.padding()
	}
}

#Preview {
	LoginView(onLogin: {}, onGoToSignUp: {})
}
