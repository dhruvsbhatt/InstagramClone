//
//  Post.swift
//  MyInstagram
//
//  Created by Dhruv on 1/17/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
    var didLike: Bool? = false
}

extension Post {
    static let MOCK_IMAGE_URL = "https://firebasestorage.googleapis.com:443/v0/b/instagramswiftui-e4bbc.appspot.com/o/profile_images%2F49DF15C5-5AED-4730-A84B-16F01C579FAF?alt=media&token=dceae9e2-1f1b-4ba4-a9ac-050b339b35dd"
    
    static var MOCK_POSTS: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "The test caption to start with",
            likes: 102,
            imageUrl: MOCK_IMAGE_URL,
            timestamp: Timestamp(), user: User.MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "The test caption to start with",
            likes: 34,
            imageUrl: "meg-1",
            timestamp: Timestamp(), user: User.MOCK_USERS[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "The test caption to start with",
            likes: 98,
            imageUrl: "swanson-1",
            timestamp: Timestamp(), user: User.MOCK_USERS[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "The test caption to start with",
            likes: 125,
            imageUrl: "brian-1",
            timestamp: Timestamp(), user: User.MOCK_USERS[4]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "The test caption to start with",
            likes: 56,
            imageUrl: "cleveland-1",
            timestamp: Timestamp(), user: User.MOCK_USERS[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "The test caption to start with",
            likes: 56,
            imageUrl: "brian-1",
            timestamp: Timestamp(), user: User.MOCK_USERS[1]
        )
    ]
}
