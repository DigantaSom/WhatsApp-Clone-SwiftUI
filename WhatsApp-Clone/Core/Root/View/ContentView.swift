//
//  ContentView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.userSession == nil {
            WelcomeView()
        } else if let currentUser = viewModel.currentUser {
            MainTabView(currentUser: currentUser)
        }
    }
}

#Preview {
    ContentView()
}
