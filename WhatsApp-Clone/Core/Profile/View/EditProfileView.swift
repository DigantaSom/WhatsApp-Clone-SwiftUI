//
//  ProfileView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject private var viewModel = EditProfileViewModel()
    @Environment(\.dismiss) private var dismissView
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        HStack(alignment: .top, spacing: 15) {
                            VStack {
                                CircularProfileImageView(user: User.MOCK_USERS[0], size: .large)
                                Text("Edit")
                                    .foregroundStyle(.green)
                            }
                            .background(
                                NavigationLink("") {
                                    ProfileImageView(imageUrl: User.MOCK_USERS[0].profileImageUrl)
                                        .navigationBarBackButtonHidden()
                                }
                                .opacity(0)
                            )
                            Text("Enter your name and add an optional profile picture")
                                .foregroundStyle(.gray)
                                .padding(.top)
                        }
                        .font(.footnote)
                        
                        HStack {
                            TextField("", text: $viewModel.fullname)
                            Text("\(25 - viewModel.fullname.count)")
                                .foregroundStyle(.gray)
                        }
                        .font(.subheadline)
                    }
                    
                    Section {
                        Text(viewModel.phoneNumber)
                            .font(.subheadline)
                    } header: {
                        Text("Phone number")
                    }
                    
                    Section {
                        NavigationLink {
                            EditAboutView(currentAbout: viewModel.about)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text(viewModel.about)
                                .font(.subheadline)
                        }
                    } header: {
                        Text("About")
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismissView()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
