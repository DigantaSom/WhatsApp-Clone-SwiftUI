//
//  ChatView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 26/05/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @Environment(\.dismiss) private var dismissView
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(MessageGroup.MOCK_MESSAGE_GROUP) { group in
                    Section {
                        ForEach(group.messages) { message in
                            MessageCell(
                                isFromCurrentUser: Bool.random(),
                                message: message
                            )
                        }
                    } header: {
                        Capsule()
                            .fill(Color(.systemGray6))
                            .frame(width: 120, height: 28)
                            .overlay {
                                Text(group.date.chatTimestampString())
                                    .font(.subheadline)
                            }
                    }

                }
            }
            .padding(.top)
            
            HStack(spacing: 15) {
                ZStack(alignment: .leading) {
                    TextField("Message...", text: $viewModel.messageText)
                        .padding(.leading, 40)
                        .padding(.trailing, 12)
                        .padding(.vertical, 5)
                        .background(Color(.systemGroupedBackground))
                        .clipShape(Capsule())
                        
                    Image(systemName: "face.smiling")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .padding(.leading, 12)
                }
                
                if viewModel.messageText == "" {
                    HStack(spacing: 15) {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 18, height: 18)
                        Image(systemName: "mic")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15)
                    }
                } else {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.green)
                }
            }
            .padding(.horizontal, 18)
            .padding(.top, 12)
            .background(Color(.systemGray5))
        }
        .background(
            Image("background_image")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        )
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar) // so that the top navbar is always visible - scrolling or not
        .toolbar(viewModel.tabBarVisibility, for: .tabBar) // to hide the bottom tab bar on this view
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(spacing: 12) {
                    Button {
                        viewModel.tabBarVisibility = .visible
                        dismissView()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    
                    HStack {
                        CircularProfileImageView(user: User.MOCK_USERS[0], size: .small)
                        Text("Elizabeth Olsen")
                    }
                }
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
            }
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 18) {
                    Image(systemName: "video")
                    Image(systemName: "phone")
                }
            }
        }
    }
}

#Preview {
    ChatView()
}
