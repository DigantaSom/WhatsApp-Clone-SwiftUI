//
//  AuthButtonModifier.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import SwiftUI

struct AuthButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: 44)
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func authButtonModifier() -> some View {
        modifier(AuthButtonModifier())
    }
}
