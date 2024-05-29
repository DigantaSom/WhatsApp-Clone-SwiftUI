//
//  NewChatItemView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 24/05/24.
//

import SwiftUI

struct NewChatItemView: View {
    private var imageName: String
    private var title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    var body: some View {
        HStack {
            Circle()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: imageName)
                }
            Text(title)
                .font(.subheadline)
        }
    }
}

#Preview {
    NewChatItemView(imageName: "person.2.fill", title: "New Group")
}
