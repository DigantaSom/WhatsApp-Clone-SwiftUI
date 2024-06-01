//
//  MainTabView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 22/05/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTabIndex: Int = 1
    private let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            Text("Updates")
                .tabItem {
                    VStack {
                        Image(systemName: "dial.low")
                        Text("Updates")
                    }
                }
                .tag(0)
            
            InboxView()
                .tabItem {
                    VStack {
                        Image(systemName: "message.fill")
                        Text("Chats")
                    }
                }
                .tag(1)
            
            SettingsView(user: currentUser)
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView(currentUser: User.MOCK_USERS[0])
}
