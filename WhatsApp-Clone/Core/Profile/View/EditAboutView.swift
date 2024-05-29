//
//  EditAboutView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 29/05/24.
//

import SwiftUI

struct EditAboutView: View {
    @StateObject private var viewModel = EditAboutViewModel()
    @Environment(\.dismiss) private var dismissView
    private var currentAbout: String
    
    init(currentAbout: String) {
        self.currentAbout = currentAbout
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    Button {
                        viewModel.showModal.toggle()
                    } label: {
                        HStack {
                            Text(currentAbout)
                                .font(.subheadline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        }
                    }
                } header: {
                    Text("Currently set to")
                }
                
                Section {
                    ForEach(viewModel.aboutList) { option in
                        Text(option.title)
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.deleteAbout(id: option.id)
                                }
                                .tint(.red)
                            }
                    }
                } header: {
                    Text("Select your about")
                }
                .font(.subheadline)
            }
        }
        .navigationTitle("About")
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
                Text("Edit")
                    .font(.subheadline)
            }
        }
        .sheet(isPresented: $viewModel.showModal) {
            EditAboutModal(text: currentAbout)
        }
    }
}

#Preview {
    EditAboutView(currentAbout: User.MOCK_USERS[0].about ?? "")
}
