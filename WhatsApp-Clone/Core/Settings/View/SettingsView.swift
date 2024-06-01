//
//  SettingsView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        HStack(spacing: 15) {
                            CircularProfileImageView(user: user, size: .large)
                            VStack(alignment: .leading) {
                                Text(user.fullname)
                                if let about = user.about {
                                    Text(about)
                                        .font(.subheadline)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        .background(
                            NavigationLink("") {
                                EditProfileView()
                                    .navigationBarBackButtonHidden()
                            }
                            .opacity(0)
                        )
                        
                        SettingsListItem(imageName: "face.dashed", title: "Avatar")
                    }
                    
                    Section {
                        SettingsListItem(imageName: "speaker.wave.2", title: "Broadcast Lists")
                        SettingsListItem(imageName: "star", title: "Starred Messages")
                        SettingsListItem(imageName: "laptopcomputer", title: "Linked Devices")
                    }
                    
                    Section {
                        SettingsListItem(imageName: "key", title: "Account")
                        SettingsListItem(imageName: "lock", title: "Privacy")
                        SettingsListItem(imageName: "message", title: "Chats")
                        SettingsListItem(imageName: "bell.badge", title: "Notifications")
                        SettingsListItem(imageName: "indianrupeesign.circle", title: "Payments")
                        SettingsListItem(imageName: "arrow.up.arrow.down", title: "Storage and Data")
                    }
                    
                    Section {
                        SettingsListItem(imageName: "info.circle", title: "Help")
                        SettingsListItem(imageName: "heart", title: "Tell a Friend")
                        Button {
                            viewModel.logout()
                        } label: {
                            SettingsListItem(imageName: "rectangle.portrait.and.arrow.right", title: "Log Out")
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    SettingsView(user: User.MOCK_USERS[0])
}
