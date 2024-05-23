//
//  ContactView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 24/05/24.
//

import SwiftUI

struct ContactView: View {
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small)
            VStack(alignment: .leading, spacing: 2) {
                Text(user.fullname)
                    .fontWeight(.semibold)
                if let about = user.about {
                    Text(about)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    ContactView(user: User.MOCK_USERS[0])
}
