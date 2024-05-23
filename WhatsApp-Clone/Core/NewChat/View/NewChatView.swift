//
//  NewMessageView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 22/05/24.
//

import SwiftUI

struct NewChatView: View {
    @StateObject private var viewModel = NewChatViewModel()
    @Environment(\.dismiss) private var dismissView
    @State private var searchText: String = ""
    
    var searchResults: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter {
                $0.fullname.contains(searchText)
                || $0.phoneNumber.contains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        NewChatItemView(imageName: "person.2.fill", title: "New Group")
                        NewChatItemView(imageName: "person.fill.badge.plus", title: "New Contact")
                        NewChatItemView(imageName: "person.3.fill", title: "New Community")
                        NewChatItemView(imageName: "speaker.wave.3.fill", title: "New Broadcast")
                    }
                    Section {
                        ForEach(searchResults) { user in
                            ContactView(user: user)
                        }
                    } header: {
                        Text("Contacts on WhatsApp")
                    }
                }
            }
            .navigationTitle("New Chat")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismissView()
                    } label: {
                        Circle()
                            .foregroundStyle(Color(.systemGray5))
                            .frame(width: 28, height: 28)
                            .overlay {
                                Image(systemName: "multiply")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(Color(.darkGray))
                            }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search name or number")
        }
    }
}

#Preview {
    NewChatView()
}
