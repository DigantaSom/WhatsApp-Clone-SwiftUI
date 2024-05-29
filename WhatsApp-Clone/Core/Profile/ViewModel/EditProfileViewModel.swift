//
//  ProfileViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import Foundation

class EditProfileViewModel: ObservableObject {
    @Published var fullname: String = "Elizabeth Olsen"
    @Published var phoneNumber: String = "+1111111"
    @Published var about: String = "Hey there! I'm using WhatsApp."
}
