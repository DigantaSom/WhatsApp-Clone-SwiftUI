//
//  ChatViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 25/05/24.
//

import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var tabBarVisibility: Visibility = .hidden
    @Published var messageText: String = ""
}
