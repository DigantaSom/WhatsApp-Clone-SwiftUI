//
//  LoginViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 27/05/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
