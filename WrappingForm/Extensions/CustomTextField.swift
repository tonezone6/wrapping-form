//
//  CustomTextField.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    var secure: Bool = false
    var keyboard: UIKeyboardType = .default
    
    @Binding var text: String
    @Binding var warning: Bool
    
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
                    .foregroundColor(.accentColor)
            })
    }
    
    var trailingImage: some View {
        let name = warning ? "exclamationmark.circle.fill" : "checkmark.circle.fill"
        
        return Image(systemName: name)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundColor(Color.gray.opacity(0.3))
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            title: "Email", secure: false,
            keyboard: .emailAddress,
            text: .constant("john.doe@jd.com"),
            warning: .constant(true)
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Light")
        
        CustomTextField(
            title: "Email", secure: false,
            keyboard: .emailAddress,
            text: .constant("john.doe@jd.com"),
            warning: .constant(false)
        )
        .previewLayout(.sizeThatFits)
        .background(Color(.systemBackground))
        .environment(\.colorScheme, .dark)
        .previewDisplayName("Dark")
    }
}
