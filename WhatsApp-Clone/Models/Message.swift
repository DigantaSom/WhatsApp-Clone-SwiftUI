//
//  Message.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 27/05/24.
//

import Foundation

struct Message: Identifiable {
    var id: String = NSUUID().uuidString
    let fromId: String
    let toId: String
    let messageText: String
    let imageUri: String?
    let timestamp: Date
}

struct MessageGroup: Identifiable {
    var id: String = NSUUID().uuidString
    let messages: [Message]
    let date: Date
}

extension MessageGroup {
    static let MOCK_MESSAGE_GROUP: [MessageGroup] = [
        .init(
            messages: [
                .init(fromId: "", toId: "", messageText: "Hello, Lizzy", imageUri: nil, timestamp: Date()),
                .init(fromId: "", toId: "", messageText: "Hello, Lizzy", imageUri: nil, timestamp: Date()),
                .init(fromId: "", toId: "", messageText: "Hello, Lizzy", imageUri: nil, timestamp: Date()),
                .init(fromId: "", toId: "", messageText: "Hello, Lizzy", imageUri: nil, timestamp: Date()),
                .init(fromId: "", toId: "", messageText: "Hello, Lizzy", imageUri: nil, timestamp: Date()),
            ], 
            date: Date()
        )
    ]
}
