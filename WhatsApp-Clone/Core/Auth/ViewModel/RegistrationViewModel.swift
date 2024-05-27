//
//  File.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var fullname: String = ""
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
}
