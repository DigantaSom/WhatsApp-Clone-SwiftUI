//
//  SettingsListItem.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import SwiftUI

struct SettingsListItem: View {
    private let imageName: String
    private let title: String
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
            Text(title)
                .font(.subheadline)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    SettingsListItem(imageName: "face.dashed", title: "Avatar")
}
