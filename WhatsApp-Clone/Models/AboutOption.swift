//
//  AboutOptions.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 29/05/24.
//

import Foundation

struct AboutOption: Identifiable {
    var id: String = NSUUID().uuidString
    let title: String
}

extension AboutOption {
    static let ABOUT_OPTIONS: [AboutOption] = [
        .init(title: "Available"),
        .init(title: "Busy"),
        .init(title: "At school"),
        .init(title: "At the movies"),
        .init(title: "At work"),
        .init(title: "Battery about to die"),
        .init(title: "Can't talk, WhatsApp only"),
        .init(title: "In a meeting"),
        .init(title: "At the gy"),
        .init(title: "Sleeping"),
        .init(title: "Urgent calls only"),
    ]
}
