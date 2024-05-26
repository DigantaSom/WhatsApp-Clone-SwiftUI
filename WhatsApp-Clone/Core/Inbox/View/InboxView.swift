//
//  InboxView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 22/05/24.
//

import SwiftUI

struct InboxView: View {
    @StateObject private var viewModel = InboxViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0 ..< 10) { _ in
                    InboxRowView()
                        .background(
                            NavigationLink("") {
                                ChatView()
                                    .navigationBarBackButtonHidden()
                            }
                            .opacity(0)
                        )
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // TODO: select chats
                    } label: {
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 30, height: 30)
                            .overlay {
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                            }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 15) {
                        Button {
                            // TODO: open camera
                        } label: {
                            Circle()
                                .fill(Color(.systemGray5))
                                .frame(width: 34, height: 34)
                                .overlay {
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 17, height: 17)
                                }
                        }
                        
                        Button {
                            viewModel.showNewChatView.toggle()
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.green)
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.showNewChatView) {
                NewChatView()
            }
        }
    }
}

#Preview {
    InboxView()
}
