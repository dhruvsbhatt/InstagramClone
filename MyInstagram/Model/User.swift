//
//  User.swift
//  MyInstagram
//
//  Created by Dhruv on 1/16/24.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable,  Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "quagmire", profileImageUrl: nil, fullname: "Glenn Quagmire", bio: "Gigigty", email: "glenn.quagmire@gmail.com"),
        .init(id: UUID().uuidString, username: "cleveland", profileImageUrl: nil, fullname: "Cleveland Brown", bio: "The Cleveland Show", email: "cleveland.brown@gmail.com"),
        .init(id: UUID().uuidString, username: "swanson", profileImageUrl: nil, fullname: "Joe Swanson", bio: "You're under arrest", email: "joe.swanson@gmail.com"),
        .init(id: UUID().uuidString, username: "meg", profileImageUrl: nil, fullname: "Meg Griffin", bio: "I need a Boyfriend", email: "meg.griffin@gmail.com"),
        .init(id: UUID().uuidString, username: "brian", profileImageUrl: nil, fullname: "Brian Griffin", bio: "Bow bow", email: "brian.griffin@gmail.com")
    ]
}
