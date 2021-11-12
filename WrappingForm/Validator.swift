//
//  FormViewModel.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

import Combine

class Validator: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var credentials: Credentials?
    @Published var disabled = true
    
    init() {
        $email.combineLatest($password)
            .map(Credentials.init)
            .assign(to: &$credentials)
            
        $credentials
            .compactMap { $0?.invalid }
            .assign(to: &$disabled)
    }
    
    func login() {
        // ...
    }
}
