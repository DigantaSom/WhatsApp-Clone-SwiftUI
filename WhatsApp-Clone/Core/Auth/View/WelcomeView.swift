//
//  WelcomeView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 27/05/24.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject private var viewModel = WelcomeViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                // this HStack is used just to center all the below content
                HStack {
                    Spacer()
                }
                Image("welcome_image")
                    .resizable()
                    .frame(
                        width: proxy.size.width - 80,
                        height: proxy.size.width - 60
                    )
                TitleView()
                LanguageChooserView()
                Spacer()
                AgreeButton(
                    width: proxy.size.width - 80,
                    viewModel: viewModel
                )
            }
            .padding(.horizontal)
            .fullScreenCover(isPresented: $viewModel.showLoginView) {
                LoginView()
            }
        }
    }
}

#Preview {
    WelcomeView()
}

struct TitleView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to WhatsApp")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Read our ")
                .foregroundStyle(.gray) +
            Text("Privacy Policy")
                .foregroundStyle(.blue) +
            Text(". Tap Agree and continue to accept the ")
                .foregroundStyle(.gray) +
            Text("Terms and Services")
                .foregroundStyle(.blue) +
            Text(".")
                .foregroundStyle(.gray)
        }
        .font(.subheadline)
        .padding(.top, 24)
    }
}

struct LanguageChooserView: View {
    var body: some View {
        Capsule()
            .fill(Color(.systemGray5))
            .frame(width: 160, height: 40)
            .overlay {
                HStack {
                    Image(systemName: "network")
                    Spacer()
                    Text("English")
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding(.horizontal)
                .font(.subheadline)
                .foregroundStyle(Color(.darkGray))
            }
            .padding(.top, 14)
    }
}

struct AgreeButton: View {
    private var width: CGFloat
    @StateObject private var viewModel: WelcomeViewModel
    
    init(width: CGFloat, viewModel: WelcomeViewModel) {
        self.width = width
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Button {
            viewModel.showLoginView.toggle()
        } label: {
            Text("Agree and continue")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: width, height: 44)
                .background(Color(.darkGray))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}
