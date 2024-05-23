//
//  CircularProfileImageView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 22/05/24.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xLarge:
            return 80
        case .xxLarge:
            return 120
        }
    }
}

struct CircularProfileImageView: View {
    private let user: User?
    private let size: ProfileImageSize
    
    init(user: User?, size: ProfileImageSize) {
        self.user = user
        self.size = size
    }
    
    var body: some View {
        if let profileImageUrl = user?.profileImageUrl {
            Image(profileImageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USERS[0], size: .medium)
}
