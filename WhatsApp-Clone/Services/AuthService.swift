//
//  AuthService.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 31/05/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func createUser(email: String, password: String, fullname: String, phoneNumber: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(uid: result.user.uid, email: email, fullname: fullname, phoneNumber: phoneNumber)
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    private func uploadUserData(uid: String, email: String, fullname: String, phoneNumber: String) async throws {
        let user = User(id: uid, email: email, fullname: fullname, phoneNumber: phoneNumber)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        UserService.shared.currentUser = user
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to login with error: \(error.localizedDescription)")
        }
    }
    
    func logout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.currentUser = nil
    }
    
    private func loadUserData() async throws {
        try await UserService.shared.fetchCurrentUser()
    }
}
