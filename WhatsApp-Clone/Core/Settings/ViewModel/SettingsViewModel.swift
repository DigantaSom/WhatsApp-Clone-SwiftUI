//
//  SettingsViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 31/05/24.
//

import Foundation

class SettingsViewModel: ObservableObject {
    func logout() {
        AuthService.shared.logout()
    }
}
