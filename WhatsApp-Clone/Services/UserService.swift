//
//  UserService.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 01/06/24.
//

import Foundation
import FirebaseFirestore

struct UserService {
    static func fetchUser(withUid uid: String) async throws -> User? {
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            return try snapshot.data(as: User.self)
        } catch {
            print("DEBUG: Failed to get user with error: \(error.localizedDescription)")
            return nil
        }
    }
}
