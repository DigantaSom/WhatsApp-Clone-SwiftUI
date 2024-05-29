//
//  ProfileImageView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 29/05/24.
//

import SwiftUI

struct ProfileImageView: View {
    @Environment(\.dismiss) private var dismissView
    @State var imageUrl: String?
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                if let imageUrl = imageUrl {
                    Image(imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.width)
                        .clipped()
                } else {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.gray)
                        .background(Color(.systemGray4))
                        .frame(width: proxy.size.width, height: proxy.size.width)
                }
                Spacer()
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismissView()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Text("Edit")
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    ProfileImageView(imageUrl: User.MOCK_USERS[0].profileImageUrl)
}
