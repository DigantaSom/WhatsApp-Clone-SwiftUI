//
//  LogoImageView.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 28/05/24.
//

import SwiftUI

struct LogoImageView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
}

#Preview {
    LogoImageView()
}
