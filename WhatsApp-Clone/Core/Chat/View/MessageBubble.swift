//
//  MessageBubble.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 26/05/24.
//

import SwiftUI

struct MessageBubble: Shape {
    let isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight],
            cornerRadii: CGSize(width: 14, height: 14)
        )
        return Path(path.cgPath)
    }
}
