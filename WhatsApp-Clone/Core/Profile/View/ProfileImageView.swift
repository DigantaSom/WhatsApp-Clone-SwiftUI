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
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                
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
                
                Spacer()
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
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.showPhotosPicker.toggle()
                } label: {
                    Text("Edit")
                        .fontWeight(.semibold)
                }
            }
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
