//
//  ContentView.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                CustomTextField(
                    title: "Email", keyboard: .emailAddress,
                    text: $viewModel.email,
                    warning: $viewModel.emailInvalid
                )
                CustomTextField(
                    title: "Password", secure: true,
                    text: $viewModel.password,
                    warning: $viewModel.passwordInvalid
                )
                Button("Login", action: viewModel.login)
                    .buttonStyle(RoundedButtonStyle())
                    .padding([.top, .bottom])
                    .disabled(viewModel.disabled)
            }
            .accentColor(.red)
            .buttonStyle(PlainButtonStyle())
            .navigationTitle("Login")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

