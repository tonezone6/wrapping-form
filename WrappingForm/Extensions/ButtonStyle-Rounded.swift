//
//  ButtonStyle-Rounded.swift
//  WrappingForm
//
//  Created by Alex Stratu on 05.03.2021.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        RoundedButton(configuration: configuration)
    }
}

extension RoundedButtonStyle {
    
    struct RoundedButton: View {
        
        @Environment(\.isEnabled) var enabled
        let configuration: RoundedButtonStyle.Configuration
        
        var foreground: Color {
            enabled ?
                (configuration.isPressed ? Color.white.opacity(0.5) : .white) :
                Color.white.opacity(0.5)
        }
        
        var gradientColors: [Color] {
            enabled ?
                [configuration.isPressed ? .red : .orange, .red] :
                [Color.gray.opacity(0.5), Color.gray.opacity(0.5)]
        }

        var gradient: LinearGradient {
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
        
        var body: some View {
            configuration.label
                .font(Font.subheadline.weight(.bold))
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(foreground)
                .background(gradient)
                .cornerRadius(8)
        }
    }
}
