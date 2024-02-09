//
//  Comment.swift
//  MyInstagram
//
//  Created by Dhruv on 2/8/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Codable {
    @DocumentID var commentId: String?
    let postOwnerUid: String
    let commentText: String
    let postId: String
    let timestamp: Timestamp
    let commentOwnerUid: String
    
    var user: User?
    
    var id: String {
        return commentId ?? UUID().uuidString
    }
}
