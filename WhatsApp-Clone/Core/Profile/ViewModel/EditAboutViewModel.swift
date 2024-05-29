//
//  EditAboutViewModel.swift
//  WhatsApp-Clone
//
//  Created by Diganta Som on 29/05/24.
//

import Foundation

class EditAboutViewModel: ObservableObject {
    @Published var aboutList = [AboutOption]()
    @Published var showModal: Bool = false
    
    init() {
        loadAbouts()
    }
    
    func loadAbouts() {
        aboutList = AboutOption.ABOUT_OPTIONS
    }
    
    func deleteAbout(id: String) {
        aboutList = aboutList.filter { $0.id != id }
    }
}
