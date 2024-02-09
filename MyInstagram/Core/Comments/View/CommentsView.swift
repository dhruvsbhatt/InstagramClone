//
//  CommentsView.swift
//  MyInstagram
//
//  Created by Dhruv on 2/8/24.
//

import SwiftUI

struct CommentsView: View {
    @State private var commentText = ""
    @StateObject var viewModel: CommentsViewModel
    
    private var currentUser: User? {
        UserService.shared.currentUser
    }
    
    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: CommentsViewModel(post: post))
    }
    
    var body: some View {
        VStack {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)
            
            Divider()
            
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }.padding(.top)
            
            Divider()
            
            HStack(spacing: 12) {
                CircularProfileImageView(user: currentUser, size: .xSmall)
                
                ZStack(alignment: .trailing) {
                    TextField("Add a comment", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray), lineWidth: 1)
                        }
                    
                    Button {
                        Task {
                            try await viewModel.uploadComment(commentText: commentText)
                            commentText = ""
                        }
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

#Preview {
    CommentsView(post: Post.MOCK_POSTS[2])
}
