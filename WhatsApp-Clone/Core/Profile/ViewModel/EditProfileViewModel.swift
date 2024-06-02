//
//  ProfileViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import Foundation

class EditProfileViewModel: ObservableObject {
    @Published var fullname: String
    @Published var phoneNumber: String
    @Published var about: String?
    
    init(fullname: String, phoneNumber: String, about: String?) {
        self.fullname = fullname
        self.phoneNumber = phoneNumber
        self.about = about
    }
    
    func updateFullname() async throws {
        try await 
            UserService.shared.updateFullname(
                fullname: self.fullname.trimmingCharacters(in: .whitespacesAndNewlines)
            )
    }
}
