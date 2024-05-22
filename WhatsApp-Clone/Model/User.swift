//
//  User.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 22/05/24.
//

import Foundation

struct User {
    var id: String = NSUUID().uuidString
    let email: String
    let fullname: String
    let phoneNumber: String
    var profileImageUrl: String?
}

extension User {
    static let MOCK_USER: User = User(
        email: "wanda@maximoff.com",
        fullname: "Wanda Maximoff",
        phoneNumber: "+111111",
        profileImageUrl: "elizabeth"
//        profileImageUrl: nil
    )
}
