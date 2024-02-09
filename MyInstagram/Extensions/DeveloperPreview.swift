//
//  DeveloperPreview.swift
//  MyInstagram
//
//  Created by Dhruv on 2/8/24.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(postOwnerUid: "123", commentText: "This is comment for preview", postId: "32984", timestamp: Timestamp(), commentOwnerUid: "23148729817")
}
