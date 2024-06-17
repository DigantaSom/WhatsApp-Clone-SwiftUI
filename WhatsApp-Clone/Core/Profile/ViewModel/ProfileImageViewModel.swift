//
//  ProfileImageViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 02/06/24.
//

import SwiftUI
import PhotosUI

class ProfileImageViewModel: ObservableObject {
    @Published var showSheet: Bool = false
    @Published var showPhotosPicker: Bool = false
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { try await loadImage(withItem: selectedImage) }
        }
    }
    @Published var profileImage: Image?
    @Published var isLoading: Bool = false
    
    @MainActor
    private func loadImage(withItem item: PhotosPickerItem?) async throws {
        guard let item = item else { return }
        guard let data = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.isLoading = true
        try await uploadUserProfileImage(uiImage: uiImage)
        self.isLoading = false
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func uploadUserProfileImage(uiImage: UIImage) async throws {
        guard let imageUrl = try await StorageUploader.uploadProfileImage(uiImage: uiImage) else { return }
        try await UserService.shared.updateProfileImage(withUrl: imageUrl)
    }
    
    @MainActor
    func deleteUserProfileImage() async throws {
        self.isLoading = true
        try await UserService.shared.updateProfileImage(withUrl: "")
        self.isLoading = false
        self.profileImage = nil
    }
}
