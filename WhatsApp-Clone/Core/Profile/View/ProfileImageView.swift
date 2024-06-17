//
//  ProfileImageView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 29/05/24.
//

import SwiftUI
import PhotosUI
import Kingfisher

struct ProfileImageView: View {
    @Environment(\.dismiss) private var dismissView
    @State var imageUrl: String?
    @StateObject private var viewModel = ProfileImageViewModel()
    @State private var sheetDetent = PresentationDetent.medium
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                
                ZStack(alignment: .center) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width, height: proxy.size.width)
                            .clipped()
                    } else {
                        if let imageUrl = imageUrl {
                            KFImage(URL(string: imageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: proxy.size.width, height: proxy.size.width)
                                .clipped()
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFill()
                                .foregroundStyle(.gray)
                                .background(Color(.systemGray4))
                                .frame(width: proxy.size.width, height: proxy.size.width)
                        }
                    }
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(3)
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                if !viewModel.isLoading {
                    Button {
                        dismissView()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                if !viewModel.isLoading {
                    Button {
                        viewModel.showSheet.toggle()
                    } label: {
                        Text("Edit")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showSheet) {
            ProfileImageSheetView(
                imageUrl: imageUrl,
                onAddPicture: {
                    viewModel.showPhotosPicker.toggle()
                },
                onDeletePicture: {
                    Task {
                        try await viewModel.deleteUserProfileImage()
                        imageUrl = nil
                    }
                }
            )
            .presentationDetents(
                [.medium],
                selection: $sheetDetent
            )
        }
        .photosPicker(
            isPresented: $viewModel.showPhotosPicker,
            selection: $viewModel.selectedImage
        )
    }
}

#Preview {
    ProfileImageView(imageUrl: User.MOCK_USERS[0].profileImageUrl)
}
