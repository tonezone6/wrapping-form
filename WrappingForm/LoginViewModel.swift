//
//  FormViewModel.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var emailInvalid = true
    @Published var password = ""
    @Published var passwordInvalid = true
    @Published private(set) var disabled = false
    
    var subscriptions: [AnyCancellable] = []
    
    init() {
        let form = $email.combineLatest($password)
            .map(LoginForm.init)
            
        form.map { $0.emailInvalid }
            .assign(to: \.emailInvalid, on: self)
            .store(in: &subscriptions)

        form.map { $0.passwordInvalid }
            .assign(to: \.passwordInvalid, on: self)
            .store(in: &subscriptions)
        
        form.map { $0.invalid }
            .assign(to: \.disabled, on: self)
            .store(in: &subscriptions)
    }
    
    func login() {
        print("perform login...")
    }
}
