//
//  LoginView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 27/05/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                LogoImageView()
                
                FloatingInputField(label: "Email", text: $viewModel.email)
                FloatingInputField(label: "Password", text: $viewModel.password)
                
                Text("Forgot password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top)
                
                Button {
                    
                } label: {
                    Text("Login")
                        .authButtonModifier()
                }
                .padding(.vertical)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Don't have an account?") +
                    Text("Sign Up")
                        .fontWeight(.bold)
                }
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top)
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
