//
//  PR-Email.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

import Foundation

@propertyWrapper public struct Email {
    public var wrappedValue: String? {
        didSet {
            let valid = wrappedValue?.isValidEmail ?? false
            self.wrappedValue = valid ? wrappedValue : nil
        }
    }

    public init(wrappedValue: String?) {
        let valid = wrappedValue?.isValidEmail ?? false
        self.wrappedValue = valid ? wrappedValue : nil
    }
}

@propertyWrapper public struct Password {
    public var wrappedValue: String? {
        didSet {
            let valid = wrappedValue?.isValidPassword ?? false
            wrappedValue = valid ? wrappedValue : nil
        }
    }

    public init(wrappedValue: String?) {
        let valid = wrappedValue?.isValidPassword ?? false
        self.wrappedValue = valid ? wrappedValue : nil
    }
}

private extension String {
    var isValidEmail: Bool {
        let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", email)
        return predicate.evaluate(with: self)
    }

    /// minimum 8 characters, 1 letter, 1 number
    var isValidPassword: Bool {
        let password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", password)
        return predicate.evaluate(with: self)
    }
}
