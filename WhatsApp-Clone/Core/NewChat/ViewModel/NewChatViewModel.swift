//
//  NewChatViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 24/05/24.
//

import Foundation

class NewChatViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchContacts()
    }
    
    private func fetchContacts() {
        users = User.MOCK_USERS
    }
}
