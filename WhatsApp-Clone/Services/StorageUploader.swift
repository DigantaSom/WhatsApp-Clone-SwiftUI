//
//  StorageUploader.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 03/06/24.
//

import UIKit
import FirebaseStorage

struct StorageUploader {
    
    static func uploadProfileImage(uiImage: UIImage) async throws -> String? {
        guard let imageData = uiImage.jpegData(compressionQuality: 0.3) else { return nil }
        let storageRef = Storage.storage().reference(withPath: "profile_images/\(NSUUID().uuidString)")
        do {
            _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload profile image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
