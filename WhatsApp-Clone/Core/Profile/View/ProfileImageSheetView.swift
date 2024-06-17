//
//  ProfileImageSheetView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 05/06/24.
//

import SwiftUI
import Kingfisher

struct ProfileImageSheetView: View {
    @Environment(\.dismiss) private var dismissView
    @State var imageUrl: String?
    var onAddPicture = {}
    var onDeletePicture = {}
    
    var body: some View {
        VStack {
            List {
                Section {
                    Button {
                        dismissView()
                        onAddPicture()
                    } label: {
                        HStack {
                            Text("Choose Photo")
                            Spacer()
                            Image(systemName: "photo")
                        }
                        .padding(.vertical, 12)
                    }
                    
                    Button {
                        dismissView()
                        onDeletePicture()
                    } label: {
                        HStack {
                            Text("Delete Photo")
                            Spacer()
                            Image(systemName: "trash")
                        }
                        .foregroundStyle(.red)
                        .padding(.vertical, 12)
                    }
                } header: {
                    HStack {
                        if let imageUrl = imageUrl {
                            KFImage(URL(string: imageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.gray)
                                .background(Color(.systemGray4))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Text("Edit Profile Picture")
                            .textCase(nil)
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.leading, 8)
                        
                        Spacer()
                        
                        Button {
                            dismissView()
                        } label: {
                            Circle()
                                .foregroundStyle(Color(.systemGray5))
                                .frame(width: 25, height: 25)
                                .overlay {
                                    Image(systemName: "multiply")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                }
            }
        }
    }
    
//    func onAddPicture(_ callback: @escaping () -> ()) -> some View {
//        ProfileImageSheetView(onAddPicture: callback)
//    }
}

#Preview {
    ProfileImageSheetView(imageUrl: "https://firebasestorage.googleapis.com:443/v0/b/whatsapp-ios-feb47.appspot.com/o/profile_images%2F99D027F9-32AA-4012-AC7D-6672B35E524E?alt=media&token=52cf0da1-cc9c-452f-a9b5-85de7fcd4479")
}
