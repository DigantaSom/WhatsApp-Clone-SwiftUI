//
//  ProfileImageViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 02/06/24.
//

import SwiftUI
import PhotosUI
import Kingfisher

class ProfileImageViewModel: ObservableObject {
    @Published var showPhotosPicker: Bool = false
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { try await loadImage(withItem: selectedImage) }
        }
    }
    @Published var profileImage: Image?
    
    @MainActor
    private func loadImage(withItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
        try await uploadUserProfileImage(uiImage: uiImage)
    }
    
    private func uploadUserProfileImage(uiImage: UIImage) async throws {
        guard let imageUrl = try await StorageUploader.uploadProfileImage(uiImage: uiImage) else { return }
        try await UserService.shared.updateProfileImage(withUrl: imageUrl)
    }
}
