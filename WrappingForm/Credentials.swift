//
//  Form.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

struct Credentials {
    @Email    var email: String?
    @Password var password: String?
        
    var invalid: Bool {
        emailInvalid || passInvalid
    }
    
    var emailInvalid: Bool {
        email == nil
    }
    
    var passInvalid: Bool {
        password == nil
    }
}
