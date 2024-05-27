//
//  FloatingInputField.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 27/05/24.
//

import SwiftUI

struct FloatingInputField: View {
    var label: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(label)
                .foregroundStyle(.gray)
                .font(
                    .system(.subheadline, design: .rounded)
                )
                .offset(
                    y: text.isEmpty ? 0 : -28
                )
            
            VStack {
                if label.lowercased() == "password" {
                    SecureField("", text: $text)
                } else {
                    let InputField = TextField("", text: $text)
                    
                    if label.lowercased() == "email" {
                        InputField
                            .keyboardType(.emailAddress)
                    } else if label.lowercased() == "phone number" {
                        InputField
                            .keyboardType(.numberPad)
                    } else {
                        InputField
                    }
                }
                Divider()
            }
        }
        .padding(.top, 30)
        .animation(
            .default,
            value: text.isEmpty ? 0 : -28
        )
    }
}

#Preview {
    FloatingInputField(label: "Email", text: .constant("a@b.com"))
}
