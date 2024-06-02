//
//  ProfileView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import SwiftUI

struct EditProfileView: View {
    private let user: User
    @StateObject private var viewModel: EditProfileViewModel
    @Environment(\.dismiss) private var dismissView
    @FocusState private var isNameFieldFocused: Bool
    @State private var oldFullname: String
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(fullname: user.fullname, phoneNumber: user.phoneNumber, about: user.about))
        self.oldFullname = user.fullname
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        HStack(alignment: .top, spacing: 15) {
                            VStack {
                                CircularProfileImageView(user: user, size: .large)
                                Text("Edit")
                                    .foregroundStyle(.green)
                            }
                            .background(
                                NavigationLink("") {
                                    ProfileImageView(imageUrl: user.profileImageUrl)
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
                                .focused($isNameFieldFocused)
                            
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
                            Text(viewModel.about ?? "")
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
                    if isNameFieldFocused {
                        Button {
                            viewModel.fullname = oldFullname
                            isNameFieldFocused = false
                        } label: {
                            Text("Cancel")
                        }
                    } else {
                        Button {
                            dismissView()
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    if isNameFieldFocused {
                        Button {
                            Task {
                                if viewModel.fullname != oldFullname {
                                    try await viewModel.updateFullname()
                                    isNameFieldFocused = false
                                    oldFullname = viewModel.fullname
                                }
                            }
                        } label: {
                            Text("Done")
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
