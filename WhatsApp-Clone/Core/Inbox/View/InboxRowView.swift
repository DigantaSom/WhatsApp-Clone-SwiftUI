//
//  InboxRowView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 22/05/24.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack {
            CircularProfileImageView(user: User.MOCK_USER, size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Elizabeth Olsen")
                    .fontWeight(.semibold)
                
                Text("Hello")
                    .foregroundStyle(.gray)
                    .lineLimit(2)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("Yesterday")
                    .foregroundStyle(.gray)
                
                Circle()
                    .frame(width: 22, height: 22)
                    .foregroundStyle(.green)
                    .overlay {
                        Text("1")
                            .foregroundStyle(.white)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
            }
        }
    }
}

#Preview {
    InboxRowView()
}
