//
//  MessageCell.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 26/05/24.
//

import SwiftUI

struct MessageCell: View {
    private var isFromCurrentUser: Bool
    private var message: Message
    
    init(isFromCurrentUser: Bool, message: Message) {
        self.isFromCurrentUser = isFromCurrentUser
        self.message = message
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(message.messageText)
                .font(.subheadline)
            
            Text(message.timestamp.timeString())
                .font(.footnote)
                .foregroundStyle(Color(.darkGray))
        }
        .frame(minWidth: 60, alignment: .trailing)
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(isFromCurrentUser ? Color("MyMessage") : .white)
        .clipShape(
            MessageBubble(isFromCurrentUser: isFromCurrentUser)
        )
        .frame(maxWidth: .infinity, alignment: isFromCurrentUser ? .trailing : .leading)
        .padding(.trailing, isFromCurrentUser ? 14 : 100)
        .padding(.leading, isFromCurrentUser ? 100 : 14)
    }
}

#Preview {
    MessageCell(isFromCurrentUser: true, message: MessageGroup.MOCK_MESSAGE_GROUP[0].messages[0])
}
