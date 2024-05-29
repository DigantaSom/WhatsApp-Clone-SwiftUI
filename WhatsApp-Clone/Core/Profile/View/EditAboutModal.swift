//
//  EditAboutModal.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 29/05/24.
//

import SwiftUI

struct EditAboutModal: View {
    @State var text: String
    @Environment(\.dismiss) private var dismissView
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismissView()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("About (\(139 - text.count))")
                    .fontWeight(.semibold)
                Spacer()
                Text("Save")
                    .fontWeight(.semibold)
            }
            .padding()
            
            List {
                Section {
                    TextField("", text: $text)
                        .font(.subheadline)
                        .frame(height: 200, alignment: .top)
                }
            }
            .padding(.top, -5)
        }
    }
}

#Preview {
    EditAboutModal(text: "Some bio")
}
