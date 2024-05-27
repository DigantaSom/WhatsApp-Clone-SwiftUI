//
//  RegistrationView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) private var dismissView
    
    var body: some View {
        VStack {
            Spacer()
            
            LogoImageView()
            
            FloatingInputField(label: "Email", text: $viewModel.email)
            FloatingInputField(label: "Full name", text: $viewModel.fullname)
            FloatingInputField(label: "Phone number", text: $viewModel.phoneNumber)
            FloatingInputField(label: "Password", text: $viewModel.password)
            
            Button {
                
            } label: {
                Text("Sign up")
                    .authButtonModifier()
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismissView()
            } label: {
                Text("Already have an account?") +
                Text("Sign in")
                    .fontWeight(.bold)
            }
            .font(.footnote)
            .foregroundStyle(.gray)
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    RegistrationView()
}
