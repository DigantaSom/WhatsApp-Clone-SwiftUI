//
//  UserService.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 01/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try snapshot.data(as: User.self)
        } catch {
            print("DEBUG: Failed to fetch current user with error: \(error.localizedDescription)")
        }
    }
    
    func fetchUser(withUid uid: String) async throws -> User? {
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            return try snapshot.data(as: User.self)
        } catch {
            print("DEBUG: Failed to get user with error: \(error.localizedDescription)")
            return nil
        }
    }
    
    @MainActor
    func updateFullname(fullname: String) async throws {
        do {
            guard let uid = self.currentUser?.id else { return }
            try await Firestore.firestore().collection("users").document(uid).updateData(["fullname": fullname])
            self.currentUser?.fullname = fullname
        } catch {
            print("DEBUG: Failed to update fullname with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func updateProfileImage(withUrl imageUrl: String) async throws {
        // if imageUrl is an empty string, then user is essentially deleting profile image
        let newImageUrl = imageUrl.isEmpty ? nil : imageUrl
        do {
            guard let uid = self.currentUser?.id else { return }
            try await Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": newImageUrl as Any])
            self.currentUser?.profileImageUrl = newImageUrl
        } catch {
            print("DEBUG: Failed to update profile image with error: \(error.localizedDescription)")
        }
    }
}
