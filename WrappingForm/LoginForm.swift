//
//  Form.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

struct LoginForm {
    
    @Email    var email: String?
    @Password var password: String?
}

extension LoginForm {
    
    var emailInvalid: Bool {
        email == nil
    }
    
    var passwordInvalid: Bool {
        password == nil
    }
}
