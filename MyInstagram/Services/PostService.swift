//
//  PostService.swift
//  MyInstagram
//
//  Created by Dhruv on 1/19/24.
//

import Foundation
import Firebase

struct PostService {
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await FirebaseConstants.PostsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await FirebaseConstants.PostsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}

// MARK: - Likes

extension PostService {
    static func likePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseConstants.PostsCollection.document(post.id).collection("post-likes").document(uid).setData([:])
        async let _ = try await FirebaseConstants.PostsCollection.document(post.id).updateData(["likes": post.likes + 1])
        async let _ = FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).setData([:])
    }
    
    static func unlikePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseConstants.PostsCollection.document(post.id).collection("post-likes").document(uid).delete()
        async let _ = try await FirebaseConstants.PostsCollection.document(post.id).updateData(["likes": post.likes - 1])
        async let _ = FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).delete()
    }
    
    static func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FirebaseConstants.UsersCollection.document(uid).collection("user-likes").document(post.id).getDocument()
        return snapshot.exists
    }
}
