//
//  RegistrationViewModel.swift
//  MyInstagram
//
//  Created by Dhruv on 1/18/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
    }
    
    var inputFieldsValid: Bool {
        if !username.isEmpty && !email.isEmpty && !password.isEmpty {
            return true
        }
        return false
    }
}
