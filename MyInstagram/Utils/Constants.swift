//
//  Constants.swift
//  MyInstagram
//
//  Created by Dhruv on 2/8/24.
//

import Firebase

struct FirebaseConstants {
    static let Root = Firestore.firestore()
    
    static let UsersCollection = Root.collection("users")
    
    static let PostsCollection = Root.collection("posts")
}
