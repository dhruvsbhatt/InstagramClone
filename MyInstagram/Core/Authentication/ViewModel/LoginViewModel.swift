//
//  LoginViewModel.swift
//  MyInstagram
//
//  Created by Dhruv on 1/18/24.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
