//
//  CustomTextField.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .default
    var secure: Bool = false
    var warning: Bool
    
    var body: some View {
        HStack {
            if secure {
                SecureField(title, text: $text)
                    .font(.subheadline)
            } else {
                TextField(title, text: $text)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .keyboardType(keyboard)
            }
            Spacer()

            if !text.isEmpty {
                clearButton
                trailingImage
            }
        }
        .animation(.linear(duration: 0.1))
    }
}

extension CustomTextField {
    var clearButton: some View {
        Button(
            action: { text.removeAll() },
            label: {
                Text("clear")
                    .font(.footnote)
                    .fontWeight(.bold)
            })
    }
    
    var trailingImage: some View {
        let name = warning ? "exclamationmark.circle" : "checkmark.circle"
        let foregroundColor: Color = warning ? .red : .green
        
        return Image(systemName: name)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundColor(foregroundColor)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            title: "Email",
            text: .constant("john.doe@jd.com"),
            keyboard: .emailAddress,
            secure: false,
            warning: true
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Light")
        
        CustomTextField(
            title: "Email",
            text: .constant("john.doe@jd.com"),
            keyboard: .emailAddress,
            secure: false,
            warning: false
        )
        .previewLayout(.sizeThatFits)
        .background(Color(.systemBackground))
        .environment(\.colorScheme, .dark)
        .previewDisplayName("Dark")
    }
}
