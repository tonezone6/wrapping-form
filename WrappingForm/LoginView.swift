//
//  ContentView.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

import SwiftUI

struct LoginView: View {
    @StateObject var validator = Validator()
        
    var body: some View {
        NavigationView {
            Form {
                CustomTextField(
                    title: "Email", text: $validator.email,
                    keyboard: .emailAddress,
                    warning: emailWarning
                )
                
                CustomTextField(
                    title: "Password", text: $validator.password,
                    secure: true,
                    warning: passWarning
                )
                
                Button("Login", action: validator.login)
                    .buttonStyle(RoundedButtonStyle())
                    .padding([.top, .bottom])
                    .disabled(validator.disabled)
            }
            .accentColor(.orange)
            .buttonStyle(PlainButtonStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Login")
        }
    }
    
    var emailWarning: Bool {
        validator.credentials?.emailInvalid ?? false
    }
    
    var passWarning: Bool {
        validator.credentials?.passInvalid ?? false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

