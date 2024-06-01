//
//  User.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 22/05/24.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String = NSUUID().uuidString
    let email: String
    let fullname: String
    let phoneNumber: String
    var profileImageUrl: String?
    var about: String? = "Hey there! I am using WhatsApp."
}

extension User {
    static let MOCK_USERS: [User] = [
        .init(email: "wanda@gmail.com", fullname: "Wanda Maximoff", phoneNumber: "+11111", profileImageUrl: "elizabeth"),
        .init(email: "batman@gmail.com", fullname: "Bruce Wayne", phoneNumber: "+11111", profileImageUrl: "batman"),
        .init(email: "ironman@gmail.com", fullname: "Tony Stark", phoneNumber: "+11111", profileImageUrl: "iron-man"),
        .init(email: "blackpanther@gmail.com", fullname: "Black Panther", phoneNumber: "+11111", profileImageUrl: "black-panther"),
    ]
}
